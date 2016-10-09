# all the imports
import os
import sqlite3
import json
from flask import Flask, request, session, g, redirect, url_for, abort, \
     render_template, flash
from recalgo import RecommendationAlgorithm

# create our little application :)
app = Flask(__name__)
app.config.from_object(__name__)

# Load default config and override config from an environment variable
app.config.update(dict(
    DATABASE=os.path.join(app.root_path, 'indie-joe.db'),
    SECRET_KEY='Pd4qR3aVFcG7ixM2awKBjiWalo1vI07w',
    USERNAME='admin',
    PASSWORD='default'
))
app.config.from_envvar('FLASKR_SETTINGS', silent=True)

# Routes
@app.route('/')
def index():
    db = get_db()
    cur = db.execute('select * from videos')
    videos = cur.fetchall()
    movies = []
    for video in videos:
        movie = []
        for field in video:
            movie.append(field)
        movies.append(movie)
    # print movies[0]
    user = [12 , 4, 50, 120, 76, 23]
    ra = RecommendationAlgorithm(user, movies)

    reccomendations = []
    for x in ra.recalgo():
        video_id = x[0]
        cur = db.execute('select * from videos where id = ?', [video_id])
        video = cur.fetchone()
        reccomendations.append(video)

    # getting editors picks
    cur = db.execute('select * from playlists where id = 1')

    playlist = cur.fetchone()
    editors = []
    if playlist:
        video_ids = playlist['list'].split(' ')
        for video_id in video_ids:
            cur = db.execute('select * from videos where id = ?', [video_id])
            editors.append(cur.fetchone())
    # print editors
    return render_template('index.html', reccomendations=reccomendations, editors=editors)

@app.route('/video/<video_id>')
def video(video_id):
    db = get_db()
    cur = db.execute('select * from videos where id = ?', [video_id])
    video = cur.fetchone()
    db.execute('update videos set views=views + 1 where id = ?', [video_id])
    db.commit()
    return render_template('video.html', video=video)

@app.route('/video/add', methods=['POST'])
def add_video():
    db = get_db()
    db.execute('insert into videos (title, description) values (?, ?)', [request.form['title'], request.form['text']])
    db.commit()
    flash('New video was successfully added')

@app.route('/search')
def search_videos():
    db = get_db()
    search_string = '%' + request.args['query'] + '%'
    cur = db.execute('select * from videos where title like ? or description like ?', [search_string, search_string])
    results = cur.fetchall()
    return render_template('search.html', query=request.args['query'], results=results)

@app.route('/playlists/<playlist_id>', methods=['POST', 'GET'])
def playlists(playlist_id):
    db = get_db()
    cur = db.execute('select * from playlists where id = ?', [playlist_id])

    playlist = cur.fetchone()
    videos = []
    if playlist:
        video_ids = playlist['list'].split(' ')
        for video_id in video_ids:
            cur = db.execute('select * from videos where id = ?', video_id)
            videos.append(cur.fetchone())

    if request.method == 'GET':
        return render_template('playlists.html', playlist=playlist, videos=videos)

@app.route('/most-viewed')
def most_viewed():
    db = get_db()
    cur = db.execute('select * from videos order by views desc')
    videos = cur.fetchall()
    return render_template('playlists.html', playlist={ 'title': 'Most Viewed' }, videos=videos)
@app.route('/genre/<genre_name>')
def genre(genre_name):
    db = get_db()
    # this is certanly the wrong way to do it and probably introduces a SQL injection flaw
    cur = db.execute('select * from videos where ' +  genre_name + ' = 1')
    videos = cur.fetchall()
    # print videos
    return render_template('playlists.html', playlist={ 'title':genre_name }, videos=videos)

@app.route('/upload', methods=['GET','POST'])
def upload():

    if request.method == 'GET':
        return render_template('upload.html')

    # TODO: Make this work

    title = request.form['title']
    description = request.form['description']
    youtube_id = request.form['video_id']

    action = 1 if request.form['action'] else 0
    comedy = 1 if request.form['comedy'] else 0
    drama = 1 if request.form['drama'] else 0
    horror = 1 if request.form['horror'] else 0
    documentary = 1 if request.form['documentary'] else 0

    db = get_db()
    db.execute('insert into videos values (title, description, youtube_id, action, comedy, drama, horror, documentary) values (? , ? , ? , ?, ? ,? , ?, ?)', [title, description, youtube_id, action, comedy, drama, horror, documentary]);
    db.commit()

    return redirect(url_for('index'))

@app.route('/new-user')
def new_user():
    return render_template('user_input.html')


# Database Functions

def connect_db():
    """Connects to the specific database."""
    rv = sqlite3.connect(app.config['DATABASE'])
    rv.row_factory = sqlite3.Row
    return rv

def get_db():
    """Opens a new database connection if there is none yet for the
    current application context.
    """
    if not hasattr(g, 'sqlite_db'):
        g.sqlite_db = connect_db()
    return g.sqlite_db

@app.teardown_appcontext
def close_db(error):
    """Closes the database again at the end of the request."""
    if hasattr(g, 'sqlite_db'):
        g.sqlite_db.close()

def init_db():
    db = get_db()
    with app.open_resource('schema.sql', mode='r') as f:
        db.cursor().executescript(f.read())
    db.commit()

# Command line commands
@app.cli.command('initdb')
def initdb_command():
    """Initializes the database."""
    init_db()
    print 'Initialized the database.'

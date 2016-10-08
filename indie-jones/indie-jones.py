# all the imports
import os
import sqlite3
import json
from flask import Flask, request, session, g, redirect, url_for, abort, \
     render_template, flash

# create our little application :)
app = Flask(__name__)
app.config.from_object(__name__)

# Load default config and override config from an environment variable
app.config.update(dict(
    DATABASE=os.path.join(app.root_path, 'indie-jones.db'),
    SECRET_KEY='Pd4qR3aVFcG7ixM2awKBjiWalo1vI07w',
    USERNAME='admin',
    PASSWORD='default'
))
app.config.from_envvar('FLASKR_SETTINGS', silent=True)

# Routes

@app.route('/video/<id>')
def video(id):
    db = get_db()
    cur = db.execute('select * from videos where id = ?', id)
    video = cur.fetchone()
    print video
    return render_template('video.html', video=video)

@app.route('/videos/add', methods=['POST'])
def add_video():
    db = get_db()
    db.execute('insert into videos (title, description) values (?, ?)', [request.form['title'], request.form['text']])
    db.commit()
    flash('New video was successfully added')

@app.route('/videos/serch', methods=['POST'])
def search_videos():
    db = get_db()
    cur = db.execute('select * from videos where title like "%?%" or description like "%?%"', [request.form['query'], request.form['query']])
    results = cur.fetchall()
    # TODO: Render the search results page

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

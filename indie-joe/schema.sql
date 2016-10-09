drop table if exists videos;
create table videos (
  id integer primary key autoincrement,
  title text not null,
  description text not null,
  youtube_id text,
  views integer default 0,
  action integer default 0,
  comedy integer default 0,
  drama integer default 0,
  horror integer default 0,
  documentary integer default 0
);

drop table if exists playlists;
create table playlists (
  id integer primary key autoincrement,
  title text not null,
  list text not null
);

insert into videos (title, description, youtube_id, horror, views) values ("Show Me", "Vince Burnham, a local detective, comes home only to find his wife shot down. What starts out as a simple murder case soon evolves into something much deeper......
", "T4jTooUTt-U", 1, 1296);
insert into videos (title, description, youtube_id, drama, views) values ("Bland Brandish", "An homage to old mafia movies, this film delivers a compelling narrative while focusing on the tension between two rival gangs.
", "E6NlDAe1HXs", 1, 288);
insert into videos (title, description, youtube_id, action, drama, views) values ("DARTH MAUL: Apprentice", "A Star Wars Fan-Film", "Djo_91jN3Pk", 1, 1, 10501790);
insert into videos (title, description, youtube_id, horror, views) values ("Killer Surprise", "This is a video that I made as an application video for film school. It had to be 3 minutes or less and I chose to make a thriller/horror movie.", "NVfsk-1ZwJM", 1, 28616);

insert into playlists (title, list) values ("Editors choice", "1 2 3 4");

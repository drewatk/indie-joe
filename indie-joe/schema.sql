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

insert into videos (title, description, youtube_id, horror, views) values ("I made a movie 1", "It's great", "MMInxg1Omv4", 1, 123);
insert into videos (title, description, youtube_id, comedy, views) values ("I made a movie 2", "It's great", "MMInxg1Omv4", 1, 652513242);
insert into videos (title, description, youtube_id, drama, views) values ("I made a movie 3", "It's great", "MMInxg1Omv4", 1, 1231);
insert into videos (title, description, youtube_id, drama, views) values ("I made a movie 4", "It's great", "MMInxg1Omv4", 1, 653);

insert into playlists (title, list) values ("Editors choice", "1 2 3 4");

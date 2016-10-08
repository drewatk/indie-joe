drop table if exists videos;
create table videos (
  id integer primary key autoincrement,
  title text not null,
  description text not null,
  youtube_id text,
  views integer default 0,
  genre text not null
);

drop table if exists playlists;
create table playlists (
  id integer primary key autoincrement,
  title text not null,
  list text not null
);

insert into videos (title, description, youtube_id, genre) values ("I made a movie 1", "It's great", "MMInxg1Omv4", "comedy");
insert into videos (title, description, youtube_id, genre) values ("I made a movie 2", "It's great", "MMInxg1Omv4", "drama");
insert into videos (title, description, youtube_id, genre) values ("I made a movie 3", "It's great", "MMInxg1Omv4", "comedy");
insert into videos (title, description, youtube_id, genre) values ("I made a movie 4", "It's great", "MMInxg1Omv4", "horror");

insert into playlists (title, list) values ("Editors choice", "1 2 3 4");

drop table if exists videos;
create table videos (
  id integer primary key autoincrement,
  title text not null,
  description text not null,
  youtube_id text,
  views integer default 0,
  genre text not null
);

insert into videos (title, description, youtube_id, genre) values ("I made a movie", "It's great", "MMInxg1Omv4", "comedy");

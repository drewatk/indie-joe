drop table if exists videos;
create table videos (
  id integer primary key autoincrement,
  title text not null,
  description text not null,
  youtube_id text,
  views integer default 0
);

insert into videos (title, description, youtube_id) values ("I made a movie", "It's great", "MMInxg1Omv4");

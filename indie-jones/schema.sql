drop table if exists videos;
create table videos (
  id integer primary key autoincrement,
  title text not null,
  description text not null,
  views integer default 0
);

insert into videos (title, description) values ("I made a movie", "It's great");

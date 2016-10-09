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
insert into videos (title, description, youtube_id, comedy, drama, views) values ("Zenith", "It's a high-speed and intense dramatic short film revolving around four ambitious students and their formula student racing team of the same name. ", "vxNRjjZeDY0", 1, 1, 1859);
insert into videos (title, description, youtube_id, action, drama, comedy, views) values ("Pulp Fiction", "Outrageously violent, time-twisting, and in love with language, Pulp Fiction was widely considered the most influential American movie of the 1990s.", "s7EdQ4FqbhY", 1, 1, 1, 2523143);
insert into videos (title, description, youtube_id, action, drama, comedy, views) values ("Kubo and the Two Strings", "Kubo and the Two Strings is an epic action-adventure from acclaimed animation studio LAIKA.", "p4-6qJzeb3A", 1, 1, 1, 3741995);
insert into videos (title, description, youtube_id, comedy, drama, views) values ("The Proposal", "The Proposal original trailer - Sandra Bullock & Ryan Reynolds in romantic comedy", "RFL8b1p1ELY", 1, 1, 2094021);
insert into videos (title, description, youtube_id, action, drama, views) values ("Poltergeist", "Legendary filmmaker Sam Raimi (“Spiderman,” “Evil Dead”, “The Grudge”) and director Gil Kenan (“Monster House”) contemporize the classic tale about a family whose suburban home is haunted by evil forces.", "HD2sz9RVzfM", 1, 1, 4494407);

insert into playlists (title, list) values ("Editors choice", "1 2 3");

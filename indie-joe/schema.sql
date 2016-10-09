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

insert into videos (title, description, youtube_id, horror, views) values ("Show Me", "Vince Burnham, a local detective, comes home only to find his wife shot down. What starts out as a simple murder case soon evolves into something much deeper......", "T4jTooUTt-U", 1, 1296);
insert into videos (title, description, youtube_id, drama, views) values ("Bland Brandish", "An homage to old mafia movies, this film delivers a compelling narrative while focusing on the tension between two rival gangs.", "E6NlDAe1HXs", 1, 288);
insert into videos (title, description, youtube_id, action, drama, views) values ("DARTH MAUL: Apprentice", "A Star Wars Fan-Film", "Djo_91jN3Pk", 1, 1, 10501790);
insert into videos (title, description, youtube_id, horror, views) values ("Killer Surprise", "This is a video that I made as an application video for film school. It had to be 3 minutes or less and I chose to make a thriller/horror movie.", "NVfsk-1ZwJM", 1, 28616);
insert into videos (title, description, youtube_id, comedy, drama, views) values ("Zenith", "It's a high-speed and intense dramatic short film revolving around four ambitious students and their formula student racing team of the same name. ", "vxNRjjZeDY0", 1, 1, 1859);
insert into videos (title, description, youtube_id, action, drama, comedy, views) values ("Pulp Fiction", "Outrageously violent, time-twisting, and in love with language, Pulp Fiction was widely considered the most influential American movie of the 1990s.", "s7EdQ4FqbhY", 1, 1, 1, 2523143);
insert into videos (title, description, youtube_id, action, drama, comedy, views) values ("Kubo and the Two Strings", "Kubo and the Two Strings is an epic action-adventure from acclaimed animation studio LAIKA.", "p4-6qJzeb3A", 1, 1, 1, 3741995);
insert into videos (title, description, youtube_id, comedy, drama, views) values ("The Proposal", "The Proposal original trailer - Sandra Bullock & Ryan Reynolds in romantic comedy", "RFL8b1p1ELY", 1, 1, 2094021);
insert into videos (title, description, youtube_id, action, drama, views) values ("Poltergeist", "Legendary filmmaker Sam Raimi (“Spiderman,” “Evil Dead”, “The Grudge”) and director Gil Kenan (“Monster House”) contemporize the classic tale about a family whose suburban home is haunted by evil forces.", "HD2sz9RVzfM", 1, 1, 4494407);
insert into videos (title, description, youtube_id, comedy, views) values ("What if Wes Anderson Directed X-Men?", "The title pretty much covers it.", "UngE0qn3VRY", 1, 1108613);
insert into videos (title, description, youtube_id, horror, drama, views) values ("Time Loop", "An amateur short film", "FU6r6TWf3uc", 1, 1, 916);
insert into videos (title, description, youtube_id, horror, drama, views) values ("Numbers", "Nick and Mia meets for the first time. They know nothing about each other and seem to know everything about everyone else. But sometimes the less you know, the better...", "iYCOXPOWlWE", 1, 1, 25450);
insert into videos (title, description, youtube_id, action, comedy, views) values ("Amateur Action Film", "An amateur action film made with no budget whatsoever and two guys who met on a film making course and wanted to have a laugh making a short film!", "DB-f5UJ9Ul4", 1, 1, 2341);
insert into videos (title, description, youtube_id, comedy, documentary views) values ("I Don't Belong Here", "Documentary for stand-up comics thinking of moving to New York City from their hometown. Chronicles the journey of NY Comic/former San Diego-La Jolla Comedy Store comic from being a top local comic to the open mic scene while adjusting to life in New York.", "_ofW1igqta4", 1, 1, 10301);
insert into videos (title, description, youtube_id, action, drama, views) values ("Dragon Ball Z: The Fall of Men", "THE FALL OF MEN a Fan-Fiction produced by YOHAN FAURE & VIANNEY GRIFFON. Based upon DRAGON BALL Z created by AKIRA TORIYAMA", "HM20wwzl4Ds", 1, 1, 20092134);
insert into videos (title, description, youtube_id, drama, views) values ("Pendulum", "A short three minute Japanese animation called 'Furiko' or 'Pendulum' originally made by Takefumi Kurashina with Muse's Exogenesis Symphony part III", "tJBt2V5-Q-E", 1, 1372141);
insert into videos (title, description, youtube_id, comedy, views) values ("The Elevator", "A short comedy film by Greg Glienna, the creator of Meet the Parents, A Guy Thing and Relative Strangers.", "Q-TQQE1y68c", 1, 1306047);
insert into videos (title, description, youtube_id, comedy, documentary, views) values ("One Year Spinning!", "Hi, I'm Jeri, and I'm an amateur hooper! I put together one full year of random practice videos I recorded on my computer so that I could visualize my progress.", "FR5FQzqdzjI", 1, 1, 285);


insert into playlists (title, list) values ("Editors choice", "1 2 3");

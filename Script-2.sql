create table if not exists collections(
collection_id serial primary key,
name_collection varchar(100) not null,
year_collection integer not null,
track_id integer not null,
album_id integer not null
);

alter table collections drop column track_id;
alter table collections drop column album_id;


create table if not exists genres(
genre_id serial primary key,
genre_name varchar(40) not null,
singer_id integer not null
);

alter table genres drop column singer_id;


create table if not exists albums(
album_id serial primary key,
singer_id integer not null,
album_title varchar(100) not null,
album_year integer not null
);

alter table albums drop column singer_id;


create table if not exists singers(
singer_id serial primary key,
genre_id integer not null,
singer_name varchar(100) not null
);

alter table singers drop column genre_id;


create table if not exists tracks(
track_id serial primary key,
track_title varchar(100) not null,
track_duration integer not null,
album_id integer references albums(album_id)
);


create table if not exists collection_tracks(
collection_tracks_id serial primary key,
track_id integer not null references tracks(track_id),
collection_id integer not null references collections(collection_id)
);


create table if not exists collaborations(
collaboration_id serial primary key,
singer_id integer not null references singers(singer_id),
album_id integer not null references albums(album_id)
);


create table if not exists multigenre(
multigenre_id serial primary key,
genre_id integer not null references genres(genre_id),
singer_id integer not null references singers(singer_id)
);



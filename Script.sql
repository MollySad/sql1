create table if not exists list_ispolnitel (
	id serial primary key,
	name varchar(15) unique not null
);

create table if not exists list_janr (
	id serial primary key,
	name varchar(20) unique not null
);

create table if not exists janr_ispol (
	id serial primary key,
	ispolnitel integer not null references list_ispolnitel(id),
	janr integer not null references list_janr(id)
);

create table if not exists list_albom (
	id serial primary key,
	name text not null,
	year integer not null
);

create table if not exists albom_ispol (
	id serial primary key,
	ispolnitel integer not null references list_ispolnitel(id),
	albom integer not null references list_albom(id)
);

create table if not exists list_trek (
	id integer primary key references list_albom(id),
	name text not null,
	duration numeric not null
);

create table if not exists sbornik (
	id serial primary key,
	name varchar(35) unique not null,
	year integer not null,
	trek integer unique not null references list_trek(id) 
);
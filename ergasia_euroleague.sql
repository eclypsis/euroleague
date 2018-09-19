CREATE DATABASE euroleague_db;

use euroleague_db;

CREATE TABLE team(
team_id varchar(10) not null,
team_name text,
year_of_creation numeric(4),
team_owner text,
primary key(team_id)
);

CREATE TABLE player(
player_id varchar(10) not null,
first_name text,
last_name text,
age numeric (2,0),
primary key(player_id)
);

CREATE TABLE team_player(
team_id varchar(10) not null,
player_id varchar(10) not null,
primary key (team_id,player_id),
foreign key (team_id) references team(team_id),
foreign key (player_id) references player(player_id)
);

CREATE TABLE statistics(
stats_id varchar(10) not null,
position text,
primary key(stats_id)
);

CREATE TABLE player_statistics(
player_id varchar(10) not null,
stats_id varchar(10) not null,
primary key (player_id,stats_id),
foreign key (player_id) references player(player_id),
foreign key (stats_id) references statistics(stats_id)
);

CREATE TABLE country(
country_id varchar(10) not null,
country_name text,
town_name text,
primary key (country_id)
);

CREATE TABLE team_country(
team_id varchar(10) not null,
country_id varchar(10) not null,
primary key (team_id,country_id),
foreign key (team_id) references team(team_id),
foreign key (country_id) references country(country_id)
);

show tables;


INSERT INTO team(Team_id, Team_name, Year_of_creation, team_owner)
VALUES("01","Anadolu Efes","1976","Tuncay Özilhan");



SELECT * FROM team;


INSERT INTO player(player_id, first_name, last_name, age)
VALUES("15", "Luigi", "Datome","33");

SELECT * FROM player;

INSERT INTO country(country_id, country_name, town_name)
VALUES ("01","Turkey","Instabul");

INSERT INTO country(country_id, country_name, town_name)
VALUES ("14","Spain","Madrid");

SELECT * FROM country;


INSERT INTO statistics(stats_id, position)
VALUES ("01"," Guard");

INSERT INTO statistics(stats_id, position)
VALUES ("02","Center");

INSERT INTO statistics(stats_id, position)
VALUES ("03","Power Forward");

INSERT INTO statistics(stats_id, position)
VALUES ("04","Shooting Guard");

INSERT INTO statistics(stats_id, position)
VALUES ("05","Small Forward");

SELECT * FROM statistics;

SELECT * FROM team;

INSERT INTO team_player(team_id,player_id)
VALUES("16","32");

INSERT INTO player_statistics(player_id, stats_id)
VALUES("33","03");

INSERT INTO team_country(team_id, country_id)
VALUES ("15","14");






SELECT team_name, country_name
FROM team, country, team_country
WHERE team.team_id=team_country.team_id
and country.country_id=team_country.country_id
and country.country_name='Turkey';


SELECT first_name, last_name
FROM player, statistics, player_statistics
WHERE player.player_id=player_statistics.player_id
AND statistics.stats_id=player_statistics.stats_id
and statistics.position='Guard';

SELECT team_name, first_name, last_name
FROM team, player, team_player
WHERE team.team_id=team_player.team_id
and player.player_id=team_player.player_id;


SELECT first_name, last_name
FROM player
group by first_name
order by first_name;


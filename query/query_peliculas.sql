#VOTOS
#levanto el archivo el ranking de cada pelicula
drop table if exists indar.votos;
create table indar.votos (opinion int, rating double, film varchar(255), index film (film));

LOAD DATA LOCAL INFILE 'C:\\Documents and Settings\\aini\\Desktop\\votos.csv' 
     INTO TABLE indar.votos 
     FIELDS TERMINATED BY ',' 
     LINES TERMINATED BY '\r\n' 
     ignore 1 lines
     (opinion, rating, film);
     
#Limpieza de datos
update indar.votos set film = replace(film,'\'','');
update indar.votos set film = replace(film,'\"','');
delete from indar.votos where (opinion is null);
delete from indar.votos where (rating is null or rating = '');
delete from indar.votos where (film is null or film = ''); 

#Hago un agrupado por pelicula
drop table if exists indar.votosAgrupado;
create table indar.votosAgrupado (film varchar(255), opinion int, rating double,  index film (film));
insert ignore into indar.votosAgrupado
Select film, sum(opinion), round(avg(rating),2) from indar.votos group by film;




#GENEROS
drop table if exists indar.generos;
create table indar.generos (film varchar(255), year varchar(255), genre varchar(50), index film (film));


LOAD DATA LOCAL INFILE 'C:\\Documents and Settings\\aini\\Desktop\\generos.csv' 
     INTO TABLE indar.generos 
     FIELDS TERMINATED BY ',' 
     LINES TERMINATED BY '\r\n' 
     ignore 1 lines
     (@col1, year,genre)
     SET 
     film = REPLACE(@col1,'"','');
     
     
#Limpieza de datos
update indar.generos set film = replace(film,'\'','');


#creamos una tabla por cada genero
drop table if exists indar.generosDocumentary;
create table indar.generosDocumentary (film varchar(255) primary key);
insert ignore into indar.generosDocumentary select distinct film from indar.generos where genre = 'Documentary';

drop table if exists indar.generosRealityTV;
create table indar.generosRealityTV (film varchar(255) primary key);
insert ignore into indar.generosRealityTV select distinct film from indar.generos where genre = 'Reality-TV';

drop table if exists indar.generosHorror;
create table indar.generosHorror (film varchar(255) primary key);
insert ignore into indar.generosHorror select distinct film from indar.generos where genre = 'Horror';

drop table if exists indar.generosShort;
create table indar.generosShort (film varchar(255) primary key);
insert ignore into indar.generosShort select distinct film from indar.generos where genre = 'Short';

drop table if exists indar.generosDrama;
create table indar.generosDrama (film varchar(255) primary key);
insert ignore into indar.generosDrama select distinct film from indar.generos where genre = 'Drama';


drop table if exists indar.generosComedy;
create table indar.generosComedy (film varchar(255) primary key);
insert ignore into indar.generosComedy select distinct film from indar.generos where genre = 'Comedy';

drop table if exists indar.generosMystery;
create table indar.generosMystery (film varchar(255) primary key);
insert ignore into indar.generosMystery select distinct film from indar.generos where genre = 'Mystery';

drop table if exists indar.generosNews;
create table indar.generosNews (film varchar(255) primary key);
insert ignore into indar.generosNews select distinct film from indar.generos where genre = 'News';

drop table if exists indar.generosSport;
create table indar.generosSport (film varchar(255) primary key);
insert ignore into indar.generosSport select distinct film from indar.generos where genre = 'Sport';

drop table if exists indar.generosSciFi;
create table indar.generosSciFi (film varchar(255) primary key);
insert ignore into indar.generosSciFi select distinct film from indar.generos where genre = 'Sci-Fi';

drop table if exists indar.generosRomance;
create table indar.generosRomance (film varchar(255) primary key);
insert ignore into indar.generosRomance select distinct film from indar.generos where genre = 'Romance';

drop table if exists indar.generosFamily;
create table indar.generosFamily (film varchar(255) primary key);
insert ignore into indar.generosFamily select distinct film from indar.generos where genre = 'Family';

drop table if exists indar.generosTalkShow;
create table indar.generosTalkShow (film varchar(255) primary key);
insert ignore into indar.generosTalkShow select distinct film from indar.generos where genre = 'Talk-Show';

drop table if exists indar.generosBiography;
create table indar.generosBiography (film varchar(255) primary key);
insert ignore into indar.generosBiography select distinct film from indar.generos where genre = 'Biography';

drop table if exists indar.generosMusic;
create table indar.generosMusic (film varchar(255) primary key);
insert ignore into indar.generosMusic select distinct film from indar.generos where genre = 'Music';

drop table if exists indar.generosAdventure;
create table indar.generosAdventure (film varchar(255) primary key);
insert ignore into indar.generosAdventure select distinct film from indar.generos where genre = 'Adventure';

drop table if exists indar.generosCrime;
create table indar.generosCrime (film varchar(255) primary key);
insert ignore into indar.generosCrime select distinct film from indar.generos where genre = 'Crime';

drop table if exists indar.generosWar;
create table indar.generosWar (film varchar(255) primary key);
insert ignore into indar.generosWar select distinct film from indar.generos where genre = 'War';

drop table if exists indar.generosGameShow;
create table indar.generosGameShow (film varchar(255) primary key);
insert ignore into indar.generosGameShow select distinct film from indar.generos where genre = 'Game-Show';

drop table if exists indar.generosMusical;
create table indar.generosMusical (film varchar(255) primary key);
insert ignore into indar.generosMusical select distinct film from indar.generos where genre = 'Musical';

drop table if exists indar.generosAnimation;
create table indar.generosAnimation (film varchar(255) primary key);
insert ignore into indar.generosAnimation select distinct film from indar.generos where genre = 'Animation';

drop table if exists indar.generosFantasy;
create table indar.generosFantasy (film varchar(255) primary key);
insert ignore into indar.generosFantasy select distinct film from indar.generos where genre = 'Fantasy';

drop table if exists indar.generosThriller;
create table indar.generosThriller (film varchar(255) primary key);
insert ignore into indar.generosThriller select distinct film from indar.generos where genre = 'Thriller';

drop table if exists indar.generosAction;
create table indar.generosAction (film varchar(255) primary key);
insert ignore into indar.generosAction select distinct film from indar.generos where genre = 'Action';

drop table if exists indar.generosHistory;
create table indar.generosHistory (film varchar(255) primary key);
insert ignore into indar.generosHistory select distinct film from indar.generos where genre = 'History';

drop table if exists indar.generosWestern;
create table indar.generosWestern (film varchar(255) primary key);
insert ignore into indar.generosWestern select distinct film from indar.generos where genre = 'Western';

drop table if exists indar.generosAdult;
create table indar.generosAdult (film varchar(255) primary key);
insert ignore into indar.generosAdult select distinct film from indar.generos where genre = 'Adult';

#creamos una tabla con todos los genros
drop table if exists indar.generosPeliculasUnicas;
create table indar.generosPeliculasUnicas (
film        varchar(255) primary key, 
year            varchar(50),
Documentary     varchar(50),
RealityTV       varchar(50),
Horror          varchar(50),
Short           varchar(50),
Drama           varchar(50),
Comedy          varchar(50),
Mystery         varchar(50),
News            varchar(50),
Sport           varchar(50),
SciFi           varchar(50),
Romance         varchar(50),
Family          varchar(50),
TalkShow        varchar(50),
Biography       varchar(50),
Music           varchar(50),
Adventure       varchar(50),
Crime           varchar(50),
War             varchar(50),
GameShow        varchar(50),
Musical         varchar(50),
Animation       varchar(50),
Fantasy         varchar(50),
Thriller        varchar(50),
Action          varchar(50),
History         varchar(50),
Western         varchar(50),
Adult           varchar(50),
genre           varchar(400),
opinion			    varchar(20),
rating			    varchar(20),
fecha			      varchar(20),
rangoopinion	  varchar(20),
rangorating		  varchar(20)
);

insert ignore into indar.generosPeliculasUnicas
Select 
    film,
    min(year),
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
from indar.generos group by film;

update indar.generosPeliculasUnicas SET Documentary = '"Documentary"'     where film in (select film from indar.generosDocumentary);
update indar.generosPeliculasUnicas SET RealityTV   = '"RealityTV"'       where film in (select film from indar.generosRealityTV);
update indar.generosPeliculasUnicas SET Horror      = '"Horror"'          where film in (select film from indar.generosHorror);
update indar.generosPeliculasUnicas SET Short       = '"Short"'           where film in (select film from indar.generosShort);
update indar.generosPeliculasUnicas SET Drama       = '"Drama"'           where film in (select film from indar.generosDrama);
update indar.generosPeliculasUnicas SET Comedy      = '"Comedy"'          where film in (select film from indar.generosComedy);
update indar.generosPeliculasUnicas SET Mystery     = '"Mystery"'         where film in (select film from indar.generosMystery);
update indar.generosPeliculasUnicas SET News        = '"News"'            where film in (select film from indar.generosNews);
update indar.generosPeliculasUnicas SET Sport       = '"Sport"'           where film in (select film from indar.generosSport);
update indar.generosPeliculasUnicas SET SciFi       = '"SciFi"'           where film in (select film from indar.generosSciFi);
update indar.generosPeliculasUnicas SET Romance     = '"Romance"'         where film in (select film from indar.generosRomance);
update indar.generosPeliculasUnicas SET Family      = '"Family"'          where film in (select film from indar.generosFamily);
update indar.generosPeliculasUnicas SET TalkShow    = '"TalkShow"'        where film in (select film from indar.generosTalkShow);
update indar.generosPeliculasUnicas SET Biography   = '"Biography"'       where film in (select film from indar.generosBiography);
update indar.generosPeliculasUnicas SET Music       = '"Music"'           where film in (select film from indar.generosMusic);
update indar.generosPeliculasUnicas SET Adventure   = '"Adventure"'       where film in (select film from indar.generosAdventure);
update indar.generosPeliculasUnicas SET Crime       = '"Crime"'           where film in (select film from indar.generosCrime);
update indar.generosPeliculasUnicas SET War         = '"War"'             where film in (select film from indar.generosWar);
update indar.generosPeliculasUnicas SET GameShow    = '"GameShow"'        where film in (select film from indar.generosGameShow);
update indar.generosPeliculasUnicas SET Musical     = '"Musical"'         where film in (select film from indar.generosMusical);
update indar.generosPeliculasUnicas SET Animation   = '"Animation"'       where film in (select film from indar.generosAnimation);
update indar.generosPeliculasUnicas SET Fantasy     = '"Fantasy"'         where film in (select film from indar.generosFantasy);
update indar.generosPeliculasUnicas SET Thriller    = '"Thriller"'        where film in (select film from indar.generosThriller);
update indar.generosPeliculasUnicas SET Action      = '"Action"'          where film in (select film from indar.generosAction);
update indar.generosPeliculasUnicas SET History     = '"History"'         where film in (select film from indar.generosHistory);
update indar.generosPeliculasUnicas SET Western     = '"Western"'         where film in (select film from indar.generosWestern);
update indar.generosPeliculasUnicas SET Adult       = '"Adult"'           where film in (select film from indar.generosAdult);

#opinion y rating
update
	indar.generosPeliculasUnicas  t1,
	indar.votosAgrupado t2
SET 
	t1.opinion = t2.opinion,
	t1.rating= t2.rating
where t1.film = t2.film;

# campo genero
update indar.generosPeliculasUnicas SET genre = 
concat(Documentary,',',RealityTV,',',Horror,',',Short,',',Drama,',',Comedy,',',
Mystery,',',News,',',Sport,',',SciFi,',',Romance,',',Family,',',TalkShow,',',
Biography,',',Music,',',Adventure,',',Crime,',',War,',',GameShow,',',Musical,',',
Animation,',',Fantasy,',',Thriller,',',Action,',',History,',',Western,',',Adult);

update indar.generosPeliculasUnicas SET genre =replace(genre,',0','');
update indar.generosPeliculasUnicas SET genre =replace(genre,'0,','');
update indar.generosPeliculasUnicas SET genre =concat('[',genre,']');

update indar.generosPeliculasUnicas SET genre = concat('"genre": ',genre);

#campo pelicula
update indar.generosPeliculasUnicas SET film =concat("{film: '",film,"'");

#campo fecha
update indar.generosPeliculasUnicas SET fecha =concat("fecha: ",'01/01/',year);

#campo year
update indar.generosPeliculasUnicas SET year =concat("year: ",year);

#campo rangorating
update indar.generosPeliculasUnicas SET rangorating = abs(rating); 

update indar.generosPeliculasUnicas SET rangorating =concat("rangorating: ",rangorating,"}");

#campo rangoopinion
update indar.generosPeliculasUnicas
SET rangoopinion = 
case 
when opinion between 0 		and 100 		then '0.1'
when opinion between 101 		and 1000		then '1'
when opinion between 1001 	and 10000		then '10'
when opinion > 10000							then '>10'
END;

update indar.generosPeliculasUnicas SET rangoopinion =concat("rangoopinion: '",rangoopinion,"'");

#campo opinion
update indar.generosPeliculasUnicas SET opinion =concat("opinion: ",opinion);

#campo rating
update indar.generosPeliculasUnicas SET rating =concat("rating: ",rating);

select 
film,
year,
genre,
opinion,
rating,
fecha,
rangoopinion,
rangorating
from indar.generosPeliculasUnicas 
where 
opinion<>'opinion: 0'and 
rating<>'rating: 0'
order by rand() limit 10000
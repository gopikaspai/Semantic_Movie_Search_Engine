Proc SQL;
Create table Combine_1 as
select a.*, b.movie_title from WORK.ACTOR1 as a
inner join 
WORK.METADATA as b
on a.actor_1_name = b.actor_1_name;
run;

Proc SQL;
Create table Combine_2 as
select a.*, b.movie_title from WORK.ACTOR2 as a
inner join 
WORK.METADATA as b
on a.actor_2_name = b.actor_2_name;
run;

Proc sql;
create table mix as
select a.*, b.* from WORK.COMBINE_1 as a
inner join 
WORK.COMBINE_2 as b
on a.movie_title = b.movie_title;
run;

Proc SQL;
Create table Combine_3 as
select a.*, b.movie_title from WORK.ACTOR3 as a
inner join 
WORK.METADATA as b
on a.actor_3_name = b.actor_3_name;
run;

Proc sql;
create table mix1 as
select a.*, b.* from WORK.COMBINE_3 as a
inner join 
MIX as b
on a.movie_title = b.movie_title;
run;

Proc SQL;
Create table Combine_4 as
select a.*, b.movie_title from WORK.BUDGET as a
inner join 
WORK.METADATA as b
on a.budget = b.budget;
run;

Proc sql;
create table mix2 as
select a.*, b.* from WORK.COMBINE_4 as a
inner join 
MIX1 as b
on a.movie_title = b.movie_title;
run;

Proc SQL;
Create table Combine_5 as
select a.*, b.movie_title from WORK.COUNTRY as a
inner join 
WORK.METADATA as b
on a.country = b.country;
run;

Proc sql;
create table mix3 as
select distinct b.movie_title, a.*, b.* from WORK.COMBINE_5 as a
inner join 
MIX2 as b
on a.movie_title = b.movie_title;
run;

Proc SQL;
Create table Combine_6 as
select a.*, b.movie_title from WORK.DIRECTORS as a
inner join 
WORK.METADATA as b
on a.director_name = b.director_name;
run;

Proc sql;
create table mix4 as
select distinct b.movie_title, a.*, b.* from WORK.COMBINE_6 as a
inner join 
MIX3 as b
on a.movie_title = b.movie_title;
run;

Proc SQL;
Create table Combine_7 as
select a.*, b.movie_title from WORK.DURATION as a
inner join 
WORK.METADATA as b
on a.duration = b.duration;
run;

Proc sql;
create table mix5 as
select distinct b.movie_title, a.*, b.* from WORK.COMBINE_7 as a
inner join 
MIX4 as b
on a.movie_title = b.movie_title;
run;

Proc SQL;
Create table Combine_8 as
select a.*, b.movie_title from WORK.GENRE as a
inner join 
WORK.METADATA as b
on a.genres = b.genres;
run;

Proc sql;
create table mix6 as
select distinct b.movie_title, a.*, b.* from WORK.COMBINE_8 as a
inner join 
MIX5 as b
on a.movie_title = b.movie_title;
run;


Proc SQL;
Create table Combine_9 as
select a.*, b.movie_title from WORK.GROSS as a
inner join 
WORK.METADATA as b
on a.gross = b.gross;
run;

Proc sql;
create table mix7 as
select distinct b.movie_title, a.*, b.* from WORK.COMBINE_9 as a
inner join 
MIX6 as b
on a.movie_title = b.movie_title;
run;

Proc SQL;
Create table Combine_10 as
select a.*, b.movie_title from WORK.IMDB_LINK as a
inner join 
WORK.METADATA as b
on a.movie_imdb_link = b.movie_imdb_link;
run;

Proc sql;
create table mix8 as
select distinct b.movie_title, a.*, b.* from WORK.COMBINE_10 as a
inner join 
MIX7 as b
on a.movie_title = b.movie_title;
run;

Proc sql;
create table mix9 as
select distinct b.movie_title, a.*, b.* from WORK.MOVIE as a
inner join 
MIX8 as b
on a.movie_title = b.movie_title;
run;







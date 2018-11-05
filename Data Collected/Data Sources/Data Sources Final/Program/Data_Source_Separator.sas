

/** FOR CSV Files uploaded from Windows **/

FILENAME CSV "/folders/myshortcuts/myfolder/movie_metadata.csv" TERMSTR=CRLF;

/** FOR CSV Files uploaded from Unix/MacOS **/

FILENAME CSV "/folders/myshortcuts/myfolder/movie_metadata.csv" TERMSTR=LF;

/** Import the CSV file.  **/

PROC IMPORT DATAFILE=CSV
		    OUT=WORK.MYCSV
		    DBMS=CSV
		    REPLACE;
RUN;

/** Print the results. **/

PROC PRINT DATA=WORK.MYCSV; RUN;

/** Unassign the file reference.  **/


FILENAME CSV;

Proc Sql;
Create table Directors as
select distinct director_name
from WORK.MYCSV;
quit;

Proc Sql;
Create table Actor1 as
select distinct actor_1_name
from WORK.MYCSV;
quit;

Proc Sql;
Create table Actor2 as
select distinct actor_2_name
from WORK.MYCSV;
quit;

Proc Sql;
Create table Actor3 as
select distinct actor_3_name
from WORK.MYCSV;
quit;

Proc Sql;
Create table Duration as
select distinct duration
from WORK.MYCSV;
quit;

Proc Sql;
Create table Gross as
select distinct gross
from WORK.MYCSV;
quit;

Proc Sql;
Create table Genre as
select distinct genres
from WORK.MYCSV;
quit;

Proc Sql;
Create table IMDB_Link as
select distinct movie_imdb_link
from WORK.MYCSV;
quit;

Proc Sql;
Create table Country as
select distinct country
from WORK.MYCSV;
quit;

Proc Sql;
Create table Rating as
select distinct content_rating
from WORK.MYCSV;
quit;

Proc Sql;
Create table Budget as
select distinct budget
from WORK.MYCSV;
quit;

Proc Sql;
Create table Year as
select distinct title_year
from WORK.MYCSV;
quit;

Proc Sql;
Create table IMDB_Score as
select distinct VAR14
from WORK.MYCSV;
quit;

Proc Sql;
Create table Movie as
select distinct movie_title
from WORK.MYCSV;
quit;

/** Import an XLSX file.  **/

PROC IMPORT DATAFILE="/folders/myshortcuts/myfolder/ACTOR1.xlsx"
		    OUT=WORK.ACTOR1
		    DBMS=XLSX
		    REPLACE;
RUN;

/** Print the results. **/

PROC PRINT DATA=WORK.ACTOR1; RUN;

PROC IMPORT DATAFILE="/folders/myshortcuts/myfolder/ACTOR2.xlsx"
		    OUT=WORK.ACTOR2
		    DBMS=XLSX
		    REPLACE;
RUN;

/** Print the results. **/

PROC PRINT DATA=WORK.ACTOR2; RUN;

PROC IMPORT DATAFILE="/folders/myshortcuts/myfolder/ACTOR3.xlsx"
		    OUT=WORK.ACTOR3
		    DBMS=XLSX
		    REPLACE;
RUN;

/** Print the results. **/

PROC PRINT DATA=WORK.ACTOR3; RUN;

PROC IMPORT DATAFILE="/folders/myshortcuts/myfolder/BUDGET.xlsx"
		    OUT=WORK.BUDGET
		    DBMS=XLSX
		    REPLACE;
RUN;

/** Print the results. **/

PROC PRINT DATA=WORK.BUDGET; RUN;

PROC IMPORT DATAFILE="/folders/myshortcuts/myfolder/COUNTRY.xlsx"
		    OUT=WORK.COUNTRY
		    DBMS=XLSX
		    REPLACE;
RUN;

/** Print the results. **/

PROC PRINT DATA=WORK.COUNTRY; RUN;

PROC IMPORT DATAFILE="/folders/myshortcuts/myfolder/DIRECTORS.xlsx"
		    OUT=WORK.DIRECTORS
		    DBMS=XLSX
		    REPLACE;
RUN;

/** Print the results. **/

PROC PRINT DATA=WORK.DIRECTORS; RUN;

PROC IMPORT DATAFILE="/folders/myshortcuts/myfolder/DURATION.xlsx"
		    OUT=WORK.DURATION
		    DBMS=XLSX
		    REPLACE;
RUN;

/** Print the results. **/

PROC PRINT DATA=WORK.DURATION; RUN;

PROC IMPORT DATAFILE="/folders/myshortcuts/myfolder/GENRE.xlsx"
		    OUT=WORK.GENRE
		    DBMS=XLSX
		    REPLACE;
RUN;

/** Print the results. **/

PROC PRINT DATA=WORK.GENRE; RUN;

PROC IMPORT DATAFILE="/folders/myshortcuts/myfolder/GROSS.xlsx"
		    OUT=WORK.GROSS
		    DBMS=XLSX
		    REPLACE;
RUN;

/** Print the results. **/

PROC PRINT DATA=WORK.GROSS; RUN;

PROC IMPORT DATAFILE="/folders/myshortcuts/myfolder/IMDB_LINK.xlsx"
		    OUT=WORK.IMDB_LINK
		    DBMS=XLSX
		    REPLACE;
RUN;

/** Print the results. **/

PROC PRINT DATA=WORK.IMDB_LINK; RUN;

PROC IMPORT DATAFILE="/folders/myshortcuts/myfolder/IMDB_SCORE.xlsx"
		    OUT=WORK.IMDB_SCORE
		    DBMS=XLSX
		    REPLACE;
RUN;

/** Print the results. **/

PROC PRINT DATA=WORK.IMDB_SCORE; RUN;

PROC IMPORT DATAFILE="/folders/myshortcuts/myfolder/MOVIE.xlsx"
		    OUT=WORK.MOVIE
		    DBMS=XLSX
		    REPLACE;
RUN;

/** Print the results. **/

PROC PRINT DATA=WORK.MOVIE; RUN;

PROC IMPORT DATAFILE="/folders/myshortcuts/myfolder/RATING.xlsx"
		    OUT=WORK.RATING
		    DBMS=XLSX
		    REPLACE;
RUN;

/** Print the results. **/

PROC PRINT DATA=WORK.RATING; RUN;

PROC IMPORT DATAFILE="/folders/myshortcuts/myfolder/YEAR.xlsx"
		    OUT=WORK.YEAR
		    DBMS=XLSX
		    REPLACE;
RUN;

/** Print the results. **/

PROC PRINT DATA=WORK.YEAR; RUN;



/** FOR CSV Files uploaded from Windows **/

FILENAME CSV "/folders/myshortcuts/myfolder/movie_metadata.csv" TERMSTR=CRLF;

/** FOR CSV Files uploaded from Unix/MacOS **/

FILENAME CSV "/folders/myshortcuts/myfolder/movie_metadata.csv" TERMSTR=LF;

/** Import the CSV file.  **/

PROC IMPORT DATAFILE=CSV
		    OUT=WORK.METADATA
		    DBMS=CSV
		    REPLACE;
RUN;

/** Print the results. **/

PROC PRINT DATA=WORK.METADATA; RUN;

/** Unassign the file reference.  **/

FILENAME CSV;

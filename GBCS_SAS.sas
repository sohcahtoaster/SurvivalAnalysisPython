/* Generated Code (IMPORT) */
/* Source File: gbcs.xls */
/* Source Path: /folders/myfolders */
/* Code generated on: 11/26/16, 1:59 PM */

%web_drop_table(WORK.IMPORT);


FILENAME REFFILE '/folders/myfolders/gbcs.xls';

PROC IMPORT DATAFILE=REFFILE
	DBMS=XLS
	OUT=WORK.IMPORT;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=WORK.IMPORT; RUN;


proc lifetest data=work.import plots=lls;
time survtime*censdead(0);
strata menopause;
run;

proc lifetest data=work.import plots=lls;
time survtime*censdead(0);
strata hormone;
run;

proc lifetest data=work.import plots=lls;
time survtime*censdead(0);
strata grade;
run;

proc lifetest data=work.import nelson method=pl plots=hazard(kernel=E);
time survtime*censdead(0);
strata grade;
run;


proc phreg data=work.import;
model survtime*censdead(0) = age size grade nodes prog_recp estrg_recp rectime;
strata hormone menopause;
run;


proc phreg data=work.import;
model survtime*censdead(0) = age size grade nodes prog_recp estrg_recp censrec;
strata hormone menopause;
run;


%web_open_table(WORK.IMPORT);
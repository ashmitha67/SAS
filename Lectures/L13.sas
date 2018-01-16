data _null_;
 x=ranuni(0);
 call symput('m',put(x,12.10));
 y=symget('m');
 y_num=input(y,12.10);
 if x=y_num then put 'OK';
 else put x= y_num=;
run;

data _null_;
 x=ranuni(0);
 call symput('m',put(x,12.10));
 y=symget('m');
 y_num=input(y,12.10);
 d=x-y_num;
 if x=y_num then put 'OK';
 else put x= y_num= d=;
run;

data _null_;
 x=ranuni(0);
 call symput('m',put(x,binary64.));
 y=symget('m');
 y_num=input(y,binary64.);
 d=x-y_num;
 if x=y_num then put 'OK';
 else put x= y_num= d=;
run;


data _null_;
 x=ranuni(0);
 call symput('m',put(x,hex16.));
 y=symget('m');
 y_num=input(y,hex16.);
 d=x-y_num;
 if x=y_num then put 'OK';
 else put x= y_num= d=;
run;

data a;
 do x=1 to 10;
  y=ranuni(0);
  output;
 end;
run;

proc sql;
select *
from dictionary.tables
where libname = 'WORK'
;


proc sql;
select *
from dictionary.columns
where libname = 'WORK'
;


data a;
set dictionary.tables;
where libname = 'WORK';
run;

data _null_;
 x=constant('pi');
 y=constant('e');
 put x= y= ;
run;

***cos(pi) calculate on the macro level;

%let cospi=%sysfunc(constant(pi));

%put ***&cospi***;

%let cospi=%sysfunc(cos(%sysfunc(constant(pi))));

%put ***&cospi***;

data a;
x=1;
y='Mike';
z=x;
run;

proc contents data=a;
run;

data a1;
 set a;
 rename y=name;
run;

data a1;
 set a;
 rename y=name;
 if _n_=1 then stop;
run; 

proc datasets;
	modify a;
	rename y=name;
quit;

/*Call execute*/

options mprint;

%macro create(set);
 data &set;
 	x='We are in the set &set';
 run;
%mend;

%create(a);

%macro create(set);
 data &set;
 	x="We are in the set &set";
 run;
%mend;

%create(a);

data abc;
 input name$;
 cards;
 a
 b
 c
 ;
run;

data _null_;
 set abc;
 %create(name);
run;

data _null_;
set abc;
data name;
x="We are in the set name";
run;

data _null_;
 set abc;
 call symput('name',name);
 %create(&name);
run;

data _null_;
 set abc;
 call symput('name',name);
 %create(symget('name'));
run;

data symget('name');
 x="We are in the set symget('name')";
run;

data _null_;
 set abc;
 call symput('name',name);
 call execute('%create(&name)');
run;


data _null_;
 set abc;
 call symput('name',name);
 call execute('%create(name)');
run;

data _null_;
 set abc;
 call execute("proc print"||" data="||name||";"||"run;"); 
run;

data abc;
 set abc;
 name='abc';
 call execute("proc print"||" data="||"abc"||";"||"run;"); 
run;

%include 'C:\Users\mini\Desktop\a.sas';

%a(5);

filename macro 'C:\Users\mini\Desktop\a.sas';

%include macro;

proc catalog cat=work.sasmacr;
 delete a.macro;
quit;

libname library 'C:\Users\mini\Desktop\';

proc format lib=library;
value signum
 low-<0='minus'
 0='zero'
 0<-high='plus';
run;

data a;
 do i=1 to 15;
  x=ranuni(0);
  y=10*(x-0.5);
  output;
 end;
 format y signum.;
run;

data _null_;
 x=15;
 put x signum.;
run;


options fmtsearch=(library);

data lib.a;
 x=15;
 format x signum.;
run;


option nofmterr;


data _null_;
	filename outbox email emailsys=MAPI;
	file outbox to=("zzz@mini.pw.edu.pl")
		subject="results"
		attach='c:\...';
	put 'Hi!';
	put 'Your result is ...';
	put 'Best Regards';
run;

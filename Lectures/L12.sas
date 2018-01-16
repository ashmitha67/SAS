data a;
 do  i=1 to 3;
  x='value'||put(i,1.);
  output;
 end;
run;

proc sql;
 select i
 into :mz
 from a
 ;
quit;



%put ***&mz***;

proc sql noprint;
 select i
 into :mz separated by 'ooo'
 from a
 ;
quit;

%put ***&mz***;

proc sql noprint;
 select i
 into :mz1-:mz3
 from a
 ;
quit;

%put ***&mz1***&mz2***&mz3***;

proc sql noprint;
 select i
 into :mz1-:mz&sysmaxlog
 from a
 ;
quit;

%put _user_;

%put ***&sysmaxlong***;

***Macro quoting;

%let create=data a; x=1; run;

%put ***&create***;

%let create=%str(data a; x=1; run;);

%let print=%str(proc print data=a; run;);

options mprint symbolgen;

%macro a;
 &create
 &print
%mend a;

%a;

libname lib1 'C:\Users\mini\Desktop';

%macro create_dataset(lib,dataset);
 data &lib.&dataset;
  x=4;
 run;
%mend;

%macro create_dataset(lib,dataset);
 data &lib..&dataset;
  x=4;
 run;
%mend;


%create_dataset(lib1,aa);

data _null_;
 x=ranuni(0);
 call symput('m',x);
 y=symget('m');
 if x=y then put 'OK';
 else put x= y=;
run;

data _null_;
 x=ranuni(0);
 call symput('m',x);
 y=symget('m');
 y_num=input(y,12.10);
 if x=y_num then put 'OK';
 else put x= y_num=;
run;

data _null_;
 x=ranuni(0);
 call symput('m',x);
 y=symget('m');
 y_num=input(y,32.30);
 if x=y_num then put 'OK';
 else put x= y_num=;
run;

data _null_;
 x=ranuni(0);
 call symput('m',x);
 y=symget('m');
 y_num=input(y,32.30);
 d=abs(x-y_num);
 if x=y_num then put 'OK';
 else put x= y_num= d=;
run;

data _null_;
 x=ranuni(0);
 call symput('m',x);
 y=symget('m');
 y_num=input(y,12.10);
 d=fuzz(abs(x-y_num));
 if d=0 then put 'OK';
 else put x= y_num= d=;
run;


%macro a(s);
 data _null_;
  call symput('var',"&s");
 run;
%mend;

%a(ABC);

%put ***&var***;

%macro a(s);
 data _null_;
  call symput('var',"&s");
 run;
 %put _local_;
%mend;

%a(ABC);


%macro a;
 data _null_;
  call symput('var',"ABC");
 run;
%mend;

%a;

%put ***&var***;

%macro a;
 data _null_;
  call symput('var',"ABC");
 run;
%PUT _local_;
%mend;

%a;


%macro a(s);
%global var;
 data _null_;
  call symput('var',"&s");
 run;
 %put _local_;
%mend;


%a(cba);

%put ***&var***;

data a;
 do i=1 to 3;
  output;
 end;
run;

data a;
 set a nobs=k;
 call symput('m',put(k,1.));
run;

%put ***&m***;

data a;
 set a nobs=k;
 if _n_=1 then call symput('m',put(k,1.));
run;

%put ***&m***;


data a;
 set a nobs=k;
 if _n_=1 then do;
	call symput('m',put(k,1.));
	stop;
 end;
run;

%put ***&m***;

data a;
 do i=1 to 3;
  output;
 end;
run;


data _null_;
 call symput('m',put(k,1.));
 stop;
 set a nobs=k;
run;

%put ***&m***;


data b;
 array arr(3) x1-x3 (3*100);
 y=vname(arr(2));
run;

proc sql;
 select memname, nobs, nvar
 from dictionary.tables
 where libname='WORK'
 ;

 select memname
 from dictionary.columns
 where libname='WORK' and name='x2';

 *columns,extfiles,indexes,macros,members,tables,catalogues;

 describe table dictionary.tables;
 describe table dictionary.columns;

 create table tab as
 select *
 from dictionary.tables
 ;
 quit;

%macro histogram(dataset);

 	%let lib=%scan(&dataset,1,'.');
	%let set=%scan(&dataset,2,'.');

	proc sql noprint;
	 select name
	 into :varnames separated by ' '
	 from dictionary.columns
	 where libname=%upcase("&lib") and memname=%upcase("&set") and type='num'
	 ;
	quit;

	%put ***&varnames***;

	proc univariate data=&dataset;
	 var &varnames;
	 histogram / normal(mu=est sigma=est color=red);
	run;
%mend;


%histogram(sashelp.class);

data c;
 set sashelp.class;
run;

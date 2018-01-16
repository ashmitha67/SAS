data pln;
 input item price_pln @@;
 cards;
 1 10
 2 20
 ;
run;

data _null_;
 set pln;
 price_usd=price_pln/3.9;
 put "Item no " item " costs " price_usd "USD";
run;

%let usd_pln=3.9;

data _null_;
 set pln;
 price_usd=price_pln/usd_pln;
 put "Item no " item " costs " price_usd "USD";
run;

data _null_;
 set pln;
 price_usd=price_pln/&usd_pln;
 put "Item no " item " costs " price_usd "USD";
run;

option symbolgen;
*option nosymbolgen;

data _null_;
 set pln;
 price_usd=price_pln/&usd_pln;
 put "Item no " item " costs " price_usd "USD";
run;

%let usd_pln=4.5;

data _null_;
 set pln;
 price_usd=price_pln/&usd_pln;
 put "Item no " item " costs " price_usd "USD";
run;

%put &usd_pln;

%put The price of dollar is &usd_pln;

%put "The price of dollar is" &usd_pln;

%put The price of dollar is "&usd_pln";

%put The price of dollar is '&usd_pln';

options nosymbolgen;

data _null_;
 set pln end=done;
 price_usd=price_pln/&usd_pln;
 put "Item no " item " costs " price_usd "USD";
 if done then %put The value of macro variable usd_pln is &usd_pln;
run;

data _null_;
 set pln end=done;
 price_usd=price_pln/&usd_pln;
 put "Item no " item " costs " price_usd "USD";
 if done then 
run;

data _null_;
 set pln end=done;
 price_usd=price_pln/&usd_pln;
 put "Item no " item " costs " price_usd "USD";
 if done then %put The value of macro variable usd_pln is &usd_pln; ;
run;


data _null_;
 set pln end=done;
 price_usd=price_pln/&usd_pln;
 put "Item no " item " costs " price_usd "USD";
 if done then ;
run;

data _null_;
 set pln end=done;
 price_usd=price_pln/&usd_pln;
 put "Item no " item " costs " price_usd "USD";
 if done then put The value of macro variable usd_pln is &usd_pln;
run;

data _null_;
 set pln end=done;
 price_usd=price_pln/&usd_pln;
 put "Item no " item " costs " price_usd "USD";
 if done then put "The value of macro variable usd_pln is" &usd_pln;
run;

data _null_;
 set pln end=done;
 price_usd=price_pln/&usd_pln;
 put "Item no " item " costs " price_usd "USD";
 if done then put "The value of macro variable usd_pln is" 3.9;
run;

data _null_;
 set pln end=done;
 price_usd=price_pln/&usd_pln;
 put "Item no " item " costs " price_usd "USD";
 if done then put "The value of macro variable usd_pln is &usd_pln";
run;

data _null_;
 set pln end=done;
 price_usd=price_pln/&usd_pln;
 put "Item no " item " costs " price_usd "USD";
 if done then put 'The value of macro variable usd_pln is &usd_pln';
run;

data car;
 do car='Mercedes','Audi','BMW';
  price+1000;
  output;
 end;
run;

proc print data=car;
 where car='BMW';
run;

%put **car**;
%put **&car**;

%let car=BMW;
options symbolgen;

proc print data=car;
 where car=&car;
run;

proc print data=car;
 where car=BMW;
run;

proc print data=car;
 where car="&car";
run;

%let car="BMW";

proc print data=car;
 where car=&car;
run;

%let car='BMW';

proc print data=car;
 where car=&car;
run;

proc print data=car;
 where car="&car";
run;

proc print data=car;
 where car="'BMW'";
run;

%let t1=variable1 variable2;
%let t2=list_of_variables;

%put &t1;
%put &t2;

%let &t2=&t1;

%put **&list_of_variables**;


%let t2=&t1;

%put &t2;

%let z1=5; %let z2=7;

%let sum=z1+z2;

%put &sum;

%let sum=&z1+&z2;
%put &sum;

%let sum=%eval(&z1+&z2);
%put &sum;

%let z1=5.12; %let z2=7.67;

%let prod=%eval(&z1*&z2);
%let prod=%sysevalf(&z1*&z2);
%put &prod;

%let prod=%sysevalf(&z1*&z2,ceil);
%put &prod;

%let y=cos(0);
%put ***&y***;
%let y=%sysfunc(cos(0));
%put **&y**;

%let today=%sysfunc(date());
%put &today;
%let today=%sysfunc(date(),ddmmyy10.);
%put **&today**;

%let zero=0;
%let y=%sysfunc(cos(&zero));
%put **&y**;

%let z1=1;
%let z&z1=2;
%put **&z1**;
%let z&z1&z1=3;
%put &z22;
%let z&z1&z1&z1=3;
%put &z222;

%let v=1;
%put **&&z&v**;

%put **&&&&z&v**;

%put _user_;

%put **&&&&z&&z&v**;

%put _all_;

%put _automatic_;

%put **&sysday**;
%put **&sysdate**;

%macro print(car);
 proc print data=car;
  where car="&car";
 run;
%mend;

%print(BMW);

option mprint;
option nosymbolgen;
%print(BMW);

%macro print(car=Audi);
 proc print data=car;
  where car="&car";
 run;
%mend;

%print;
%print(BMW);
%print(car=BMW);

%macro print(set=car,car=);
 proc print data=&set;
  where car="&car";
 run;
%mend;

%print(car=Mercedes)

%print(set=car,car=Mercedes)

%print;

%macro print(set=,sdf=);
 proc print data=&set;
  where item=&sdf;
  title "Data set &set";
 run;
%mend;

%print(set=Pln,sdf=1)

data b;
 x=20;
run;

proc print data=b;
run;

%macro print(set=,sdf=);
 proc print data=&set;
 %* here is a comment;
  where item=&sdf;
  /*and here*/
  *asdkhasd;
  title "Data set &set";
 run;
%mend;

%print(set=Pln,sdf=1)

%macro mini;
 %if &sysday=Monday %then %do;
 				data day;
				 day='Monday';
				run;
 %end;
 %else %do;
  		proc print data=car;
		run;
 %end;
%mend;

%mini;

%macro mini;
 %if &sysday=Sunday %then %do;
 				data day;
				 day='Sunday';
				run;
 %end;
 %else %do;
  		proc print data=car;
		run;
 %end;
%mend;

%mini;

option mlogic;

%mini;

%macro generate(what,len,value);
 %if %upcase(&what)=TEXT %then %do;
	data a;
 	 length var $ &len;
	 var="&value";
	run;
 %end;
 %else %if %upcase(&what)=NUMBER %then %do;
	data a;
 	 length var &len;
	 var=&value;
	run;
 %end;
 %else %put go away!;
%mend;


%generate(asda);
%generate(TeXt,1,A);

%generate(numBER,3,26);

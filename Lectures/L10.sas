%let v=1;

%put ***&v***;

option mprint;
option symbolgen;

data a;
 x=&v;
run;

data a&v;
 x=66;
run;

data cars;
 input car$ price;
 cards;
 Audi 100
 BMW 200
 Mercedes 300
 ;
run;

%macro print(set=cars,car=);
 proc print data=&set;
  where car=&car;
 run;
%mend;

%print(car=Audi);

%macro print(set=cars,car=);
 proc print data=&set;
  where car="&car";
 run;
%mend;

%print(car=Audi);

%macro gen(what,len,val);
 %if %upcase(&what)=TEXT %then %do;
  data a;
   length variable $ &len;
   variable="&val";
  run;
  %end;
  %else %if %upcase(&what)=NUMBER %then %do;
  data a;
   length variable &len;
   variable=&val;
  run;
  %end;
 %else %put ERROR;
%mend;

option nosymbolgen;

%gen(TeXt,2,ab);

%gen(number,5,12);

%gen(ewertwef,5,12);

%macro loop;
  %do i=1 %to 5;
   data set&i;
    array z(7);
	do i=1 to dim(z);
	 z(i)=floor(6*ranuni(0));
	end;
	drop i;
	format _all_ 1.;
   run;
  %end;
%mend;

%loop;

%macro loop(n);
 data %do i=1 %to &n;
 		set&i (keep=x&i)
	   %end;
	   ;
	%do i=1 %to &n;
	 x&i=&i;
	%end;
 run;
%mend;

%loop(10);

%macro diff_loop(n);
 data join;
  set %do i=1 %to &n;
   		set&i
  	  %end;	
	  ;
run;
%mend;

%diff_loop(7);

*Macro DO WHILE and DO UNTIL;

%macro last(text);
 %let i=1;
 %let z=%scan(&text,&i);

 %do %while (&z ne );
  %let i=%eval(&i+1);
  %let z=%scan(&text,&i);
 %end;

%let i=%eval(&i-1);
%let z=%scan(&text,&i);

%put ***&z***;
%mend;

%last(abc car math SAS);

%macro create(N);
 %do i=1 %to &N;
  %let v&i=&i;
 %end;

 %put _user_;
%mend;

%create(3);


%macro create(N);
 %do i=1 %to &N;
  %let w&i=&i;
 %end;

 %do i=1 %to &N;
  %put Value of macro variable w&i is &w&i;  
 %end;
%mend;


%create(3);

%macro create(N);
 %do i=1 %to &N;
  %let w&i=&i;
 %end;

 %do i=1 %to &N;
  %put Value of macro variable w&i is &&w&i;  
 %end;
%mend;

%create(5);

%put ***&w1***;

%put ***&w5***;


%macro create(N);
 %global w2;
 %do i=1 %to &N;
  %let w&i=&i;
 %end;

 %do i=1 %to &N;
  %put Value of macro variable w&i is &&w&i;  
 %end;
%mend;


%create(5);

%put ***&w2***;

%put ***&w5***;

%macro create(N);

 %do i=1 %to &N;
  %global w&i;
  %let w&i=&i;
 %end;

 %do i=1 %to &N;
  %put Value of macro variable w&i is &&w&i;  
 %end;
%mend;

%create(10);

%put _global_;

%put _user_;

%macro a;
 %local i;
 %let i=1;
 %put _local_;
%mend;

%a;

%macro b;
 %local x;
 %let x=5;
 %let y=&x;
 %put _local_;
%mend;

%b;

%let x=2;
%put _global_;

%b;

%put ***&x***;

%macro b;
 %let y=&x;
 %put _local_;
%mend;

%b;

%macro outside;
 %local x;
 %let x=1;
 %inside
 %put Outside:;
 %put _local_;
%mend;

%macro inside;
 %local y;
 %let y=&x;
 %put Inside:;
 %put _local_;
%mend;

%outside;

%put ***&x***;

%macro big;
 %put ***BIG***;
 %macro small;
  %put ***small***;
 %mend;
%mend;

%big;

%small;

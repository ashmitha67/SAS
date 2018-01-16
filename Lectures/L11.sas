%let m=5;

data a;
 x=&m;
run;

options mprint;

data a;
 x=&m;
run;

%macro a(n);
 data a;
  x=&n;
 run;
%mend;

%a(16)

options nomprint;

data a;
 x=&m1m1;
run;

data a;
 x=1; y=5;
run;

data _null_;
 set a;
 if x<=y then
  do;
   %let bigger=y;
  end;
  else do;
         %let bigger=x;
       end;
run;

%put The bigger one is &bigger;

data a;
 x=10; y=5;
run;

data _null_;
 set a;
 if x<=y then
  do;
   %let bigger=y;
  end;
  else do;
         %let bigger=x;
       end;
run;

%put The bigger one is &bigger;

data _null_;
 set a;
 if x<=y then
  do;
   call symput('bigger',y);
  end;
  else do;
        call symput('bigger',x);
       end;
run;

%put The bigger one is &bigger;

%put The bigger one is *&bigger*;

data a;
 x=10; y=50;
run;

data _null_;
 set a;
 if x<=y then
  do;
   call symput('bigger',y);
  end;
  else do;
        call symput('bigger',x);
       end;
run;

%put The bigger one is &bigger;

%put The bigger one is *&bigger*;

data _null_;
 set a;
 if x<=y then
  do;
   call symput('bigger',put(y,2.));
  end;
  else do;
        call symput('bigger',put(x,2.));
       end;
run;

%put The bigger one is &bigger;

%put The bigger one is *&bigger*;

data _null_;
 set a;
 if x<=y then
  do;
   call symput('bigger','y');
  end;
  else do;
        call symput('bigger','x');
       end;
run;

%put The bigger one is *&bigger*;

data a;
 do i=1 to 5;
  x='val'||put(i,1.);
 end;
run;


data a;
 do i=1 to 5;
  x='val'||put(i,1.);
  output;
 end;
run;

data _null_;
 set a;
 call symput('mv'||put(_n_,1.),x);
run;

%put _user_;

data _null_;
 set a;
 call symput(x,i);
run;

%put _user_;

data _null_;
 set a;
 call symput(x,x);
run;

%put _user_;

data _null_;
 set a;
 call symput(i,x);
run;

data _null_;
 set a;
 call symput(put(i,1.),x);
run;

%let v=variable;
%put *&v*;

data _null_;
 set a end=k;
 if k then call symput (v,'New variable');
run;

%put *&v*;

data _null_;
 set a end=k;
 if k then call symput (&v,'New variable');
run;

%put *&v*;

data _null_;
 set a end=k;
 if k then call symput ('&v','New variable');
run;

%put *&v*;

data _null_;
 set a end=k;
 if k then call symput ("&v",'New variable');
run;

%put *&v*;
%put *&variable*;

data _null_;
 set a end=k;
 if k then call symput ('New variable',"&v");
run;

data _null_;
 set a end=k;
 if k then call symput ('v','New variable');

run;

 %put *&v*;

 %let a=1;

data b;
 call symput('a','2');
 a=&a;
 put a=;
run;
%put *&a*;


 %let a=1;
data b;
 call symput('a','2');
 a=symget('a');
 put a=;
run;
%put *&a*;

 %let a=1;
data b;
 length a $ 1;
 call symput('a','2');
 a=symget('a');
 put a=;
run;
%put *&a*;

data a;
 do i=1 to 5;
  x='val'||put(i,1.);
  output;
 end;
run;
proc sql;

 select i
 into :mv
 from a
 ;

 %put *&mv*;

 select i
 into :mv separated by ' '
 from a
 ;

 %put *&mv*;

 select i
 into :mv1-:mv5
 from a
 ;

 %put _user_;

 select i
 into :mv1-:mv&sysmaxlong
 from a
 ;

 %put *&sysmaxlong*;
 %put _user_;

 select i
 into :mv separated by ' or x='
 from a
 ;

  %put _user_;


  select i,x
 into :mvi, :mvx 
 from a
 ;

   %put _user_;

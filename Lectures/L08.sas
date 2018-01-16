data a;
 input x$ y z @@;
 CARDS;
 A 1 10 A 1 20 A 2 30 B 2 40 B 2 23 C 8 11 C 8 22
 ;
run;

proc freq data=a;
run;

proc freq data=a;
 table x x*y;
run;

proc freq data=a;
 table y*z;
 by x;
run;

proc freq data=a noprint;
 tables y*z / out=ppp;
run;

proc freq data=a noprint;
 tables y*z / out=ppp;
 by x;
run;

proc freq data=a noprint;
 tables y*z / out=ppp;
 tables x / out=pks;
run;


proc means data=a;
run;

proc means data=a;
var x;
run;

proc means data=a;
var y;
run;

data a;
 input x$ y z @@;
 cards;
 A 1 10 A . 20 A 2 30 B . 40 B 2 23 C . 11 C 8 22
 ;
run;

proc means data=a;
run;

proc means data=a;
var y;
run;


data a;
 input x$ y z @@;
 CARDS;
 A 1 10 A 1 20 A 2 30 B 2 40 B 2 23 C 8 11 C 8 22
 ;
run;

proc means data=a;
 var y;
 by x;
run;

proc means data=a noprint; 
 output out=ameans;
run;

proc means data=a noprint; 
 output out=ameans;
run;

proc summary data=a;
 output out=ameans;
run;

proc summary data=a;
 var y z;
 output out=ameans;
run;


proc means data=a noprint;
 var y;
 output out=ameans;
run;

proc means data=a noprint;
 class x;
 output out=ameans;
run;


proc means data=a noprint;
 class z;
 output out=ameans;
run;

proc means data=a noprint;
 class x y;
 output out=ameans;
run;


proc means data=a noprint nway;
 class x y;
 output out=ameans;
run;

proc means data=a noprint;
 class x y z;
 ways 2;
 output out=ameans;
run;

proc means data=a noprint;
 class x y z;
 types y y*z x*z;
 output out=ameans;
run;

*CLASS vs. BY;

proc means data=a min q1 median q3 max;
 var y;
run;

proc means data=a  min q1 median q3 max;
 var y;
 output out=amean;
run;

proc means data=a  min q1 median q3 max;
 var y;
 output out=amean min=min_y q1=q1_y median=median_y;
run;


proc means data=a  min q1 median q3 max;
 var y;
 output out=amean min= q1= median= q3= max=/autoname;
run;

proc means data=a  min q1 median q3 max;
 var y z;
 output out=amean min= q1= median= q3= max=/autoname;
run;

proc univariate data=a;
run;

proc univariate data=a;
 var y;
 output out=ppp;
run;

proc univariate data=a;
 var y;
 output out=ppp normaltest=zzz;
run;

data b;
 do i=1 to 500;
  x=rannor(0);
  output;
 end;
 drop i;
run;

proc univariate data=b noprint;
 var x;
 histogram;
run;

proc univariate data=b noprint;
 var x;
 histogram / normal(noprint) midpoints=-3 to 3 by 0.25;
run;

/*************FORMATS*********************************/
data c;
 x=20500;
 format x ddmmyy10.;
run;

data d;
 set c;
run;

proc print data=c;
 format x date9.;
run;

proc format;
 value my 	0-20='smal'
 			21-40='med'
			41-50='big';
run;

data d;
 do i=1 to 50;
  x=floor(50*ranuni(0));
  output;
 end;
 format x my.;
 drop i;
run;

data e;
 x=200;
 format x my.;
run;


proc sort data=d out=ds;
 by x;
run;

data e;
 set ds;
 by x;
 if first.x;
run;


data e;
 set ds;
 by groupformat x;
 if first.x;
run;


proc format;
 value branch 0='HQ'
 			  1='B1'
			  other='Error';
run;

data _null_;
 x=-10;
 put x branch.;
run;


proc format;
 value $PROV 'ONTARIO'='ON'
 				'ALBERTA'='AB'
				other='OTHER';
run;


data _null_;
x='ONTARIO';
y='aksjdhas';
put x PROV. y PROV.;
run;


proc format;
 value xyz low-<0='negative'
 			0-high=[commax12.2];
run;

data a;
 x=-10;output;
 x=12354.89; output;
 format x xyz.; 
run;

data dict;
input x car$;
cards;
1 Mercedes
2 Audi
3 BMW
;
run;

data temp;
 set dict;
 fmtname='cars';
 rename x=start car=label;
run;

proc format cntlin=temp;
run;

data _null_;
z=1;
put z cars.;
run;

data p;
 do i=1 to 5;
  output;
 end;
run;

data p1;
 set p;
 if put(i,cars.)='Audi';
run;

proc format;
 invalue info 'one'=1
 				'two'=2
				other=_error_
				;
run;

data z;
 input x info.;
 cards;
two
one
ajsdgasjdg
 ;
run;

proc format;
 picture aaa low-high="99.99" (prefix='PLN ');
run;

data _null_;
 x=23.3;
 put x aaa.;
run;

data _null_;
 x=2234234.324342342343;
 put x aaa.;
run;

proc format;
 picture aaa low-high="99999999999.99" (prefix='PLN ');
run;

data _null_;
 x=2234234.324342342343;
 put x aaa.;
run;



proc format;
 picture aaa low-high="000000000000.99" (prefix='PLN ');
run;


data _null_;
 x=2234234.324342342343;
 put x aaa.;
run;

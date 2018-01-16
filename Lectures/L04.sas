data a b c;
 do i= 1 to 10;
  x=floor(5*ranuni(0));
  y=floor(5*ranuni(0));
  if x>y then output a;
   else if x<y then output b;
    else output c;
 end;
run;

data a (keep=x) b (drop=i) c;
 do i= 1 to 10;
  x=floor(5*ranuni(0));
  y=floor(5*ranuni(0));
  if x>y then output a;
   else if x<y then output b;
    else output c;
 end;
run;

data a1;
 set a;
 y=x;
 drop x;
run;


data a1;
 rename x=y;
 set a;
run;

data a1;
 rename x=y;
 set a;
 put _all_;
run;

data a;
 input x y;
 cards;
 1 4
 2 5
 3 .
 ;
run;

proc transpose data=a out=at;
run;

proc transpose data=a out=at;
var x;
run;

proc transpose data=a out=at;
var x y;
run;

data a;
 input x$ y$;
 cards;
 a b
 c d
 e f
 ;
run;

proc transpose data=a out=at;
run;

proc transpose data=a out=at;
var x;
run;

data a;
 input x$ y;
 cards;
 a 1
 c 2
 e 3
 ;
run;

proc transpose data=a out=at;
run;


proc transpose data=a out=at;
var x;
run;

proc transpose data=a out=at;
var x y;
run;

data a;
 input car$ eng hp;
 cards;
 Mercedes 3.0 180
 BMW 3.0 200
 Audi 4.2 200
 ;
run;

proc transpose data=a out=at;
run;

proc transpose data=a out=at;
 id car;
run;

proc transpose data=a out=at (rename =(_name_=var));
 id car;
run;


data a;
 input car$ eng hp;
 cards;
 Mercedes 3.0 180
 BMW 3.0 200
 Audi 4.2 200
 BMW 2.0 170
 ;
run;

proc transpose data=a out=at (rename =(_name_=var));
 id car;
run;


data a;
 input no car$ eng hp;
 cards;
 1 Mercedes 3.0 180
 2 BMW 3.0 200
 3 Audi 4.2 200
 4 BMW 2.0 170
 ;
run;


proc transpose data=a out=at (rename =(_name_=var));
 id no;
run;


proc transpose data=a out=at ;
 id no;
 idlabel car;
run;

data a;
 input year qrt price;
 datalines;
 2016 1 10
 2016 2 30
 2016 3 50
 2016 4 20
 2017 1 20
 2017 2 10
 2017 3 40
 2017 4 30
;
run;


proc transepose data=a out=at;
 by year;
run; 

proc transpose data=a out=at;
 by year qrt;
run; 

proc transpose data=a out=at;
 by year;
 id qrt;
run; 

proc transpose data=a out=at;
 by qrt;
 id year;
run; 

proc sort data=a out=as;
by qrt;
run;


proc transpose data=as out=ast;
 by qrt;
 id year;
run; 


data asmod;
 set as;
 txt="Price in year "||year;
run;

data asmod;
 set as;
 pppp=put(year,4.0);
 txt="Price in year "||pppp;
run;


proc transpose data=asmod out=asmodt;
 by qrt;
 id year;
 idlabel txt;
run; 

proc transpose data=asmod out=asmodt(drop=_name_);
 by qrt;
 id year;
 idlabel txt;
run; 

data a;
 do id='A','B','C';
  do x=1 to 4;
   y=floor(10*ranuni(0));
   output;
  end;
 end;
run;

proc sql;

select x 
from a
;

select x, today() as today
from a
;

select x, today() as today format=ddmmyy8. label='my var'
from a
;

create table b as
select x, today() as today format=ddmmyy8. label='my var'
from a
;

select distinct x
from a
;


select *
from a
;

select distinct *
from a
;

select *
from a
where id='A'
;

select *
from a
where id in ('A','B')
;

select *
from a
where y is missing;

select *
from a
where y is not missing;


select *
from a
where y between 1 and 2;

quit;

data a;
 set a;
 z=floor(10*ranuni(0));
run;

proc sql;

select y,z,y+z as sum
from a
where sum>7
;

select y,z,y+z as sum
from a
where y+z>7
;

select y,z,y+z as sum
from a
where calculated sum>7
;

select y,z,y+z as sum,sum/2 as c
from a
;

select y,z,y+z as sum,calculated sum/2 as c
from a
;

select *
from a
order by y
;

select y,z,sum(y,z) as sum
from a
order by y
;

select y,z,sum(y) as sum
from a
order by y
;

select y,z,avg(y) as sum
from a
order by y
;

select *
from a
where y>avg(y)
;

select *
from a
having y>avg(y)
;


select x,avg(y) as avg
from a 
group by x
;

select x,avg(y) as avg_y
from a 
group by x
having y>avg_y
;

select y,avg_y
from (select *,avg(y) as avg_y
		from a)
where y>avg_y
;


select y
from a
where y> (select avg(y) 
			from a
		)
;

select z
from a
where z>(
		select y 
		from a
		)
;

select z
from a
where z>all (
		select y 
		from a
		)
;

select z
from a
where z>any (
		select y 
		from a
		)
;



select z
from a
where z> (
		select max(y) 
		from a
		)
;

select z
from a
where z> (
		select min(y) 
		from a
		)
;

select x,y
from a
group by x
having avg(y)>(select avg(y) from a)
;


quit;

data a;
 input id $ x y;
 cards;
 A 1 1000
 B 1 1
 C 1 1
 ;
run;

proc sql;
 select *
 from a
 where id ne 'A'
 group by x
 having avg(y)>1
 ;

  select *
 from a
 where id ne 'A'
 group by x
 having avg(y)=1
 ;

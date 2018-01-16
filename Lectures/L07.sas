data a;
 input x$ /  y ;
 cards;
 A
 1
 B
 2
 ;
run;

data b;
 input x$ v;
 cards;
 A 20
 C 22
 X 40
 ;
run;

proc sql;

 select *
 from a
 	left join
 	b
on a.x=b.x
;

 select *
 from a
 	right join
 	b
on a.x=b.x
; 

 select *
 from a
 	full join
 	b
on a.x=b.x
; 

 select *
 from a
 	inner join
 	b
on a.x=b.x
; 

data a;
 input x $ y;
 cards;
 A 1
 B 2
 C 3
 ;
run;

data b;
 input x$ v;
 cards;
 B 20
 C 21
 D 22
 ;
run;

data c;
 merge a b;
 by x;
run;

proc sql noprint;

create table c_sql as
select *
from a 
	full join b
	on a.x=b.x
;

create table c_sql as
select coalesce(a.x,b.x) label='x',y,v
from a 
	full join b
	on a.x=b.x
;

data a;
 input x $ y;
 cards;
 A 1
 B 2
 B 3
 C 3
 ;
run;

data b;
 input x$ v;
 cards;
 B 20
 B 21
 D 22
 ;
run;


data c;
 merge a b;
 by x;
run;

proc sql;

create table c_sql as
select coalesce(a.x,b.x) label='x',y,v
from a 
	full join b
	on a.x=b.x
;

data a;
 input x$ y z;
 cards;
 A 1 1
 B 2 2
 C 3 3
 B 2 2
 ;
run;

data b;
 input x$ y v;
 cards;
 D 20 3
 B 2 4
 A 1 1
 ;
run;

proc sql;

select *
from a
except 
select *
from b
;

select *
from a
except all
select *
from b
; 


select *
from a
except corr
select *
from b
; 

data aa;
 input x y;
 cards;
 1 10
 2 20
 ;
run;

data bb;
 input y x;
 cards;
 1 10
 4 40
 ;
run;

proc sql;
select *
from aa
except 
select *
from bb
; 


select *
from aa
except corr
select *
from bb
; 

data a;
 input x$ y;
 cards;
 A 1
 B 2
 C 3
 D 4
 B 2
 ;
run;

data b;
 input u x$;
 cards;
 1 A
 20 y
 30 z
 ;
run;


proc sql;

select *
from a
except
select *
from b
;

select *
from a
except all corr 
select *
from b
;

data a;
 input x$ y z;
 cards;
 A 1 1
 B 2 2
 C 3 3
 B 2 2
 ;
run;

data b;
 input x$ y v;
 cards;
 D 20 3
 B 2 4
 A 1 1
 ;
run;


proc sql;

select *
from a
intersect
select *
from b
;


select *
from a
intersect corr
select *
from b
;

select *
from a
intersect all corr
select *
from b
;

select *
from a
union
select *
from b
;

select *
from a
union all
select *
from b
;


select *
from a
union corr
select *
from b
;

select *
from a
outer union
select *
from b
;

create table c as
select *
from a
outer union
select *
from b
;


create table c as
select *
from a
outer union corr
select *
from b
;


data a;
input x1 x2 x3 x4;
cards;
1 2 3 4
4 2 6 3
2 3 5 7
1 2 3 6
;
run;


data b;
set a;
array x(*) _all_;
d=dim(x);
if _n_=1 then do;
 k= ceil(d*ranuni(0));
 set a point=k;
end;
output;
stop;
run;

data b;
set a;
array x(*) _all_;
d=dim(x);
if _n_=1 then do;
 k= ceil(d*ranuni(0));
 set a point=k;
end;
output;
run;




data a;
 input x$ y;
 cards;
 A 1
 B 2
 C 3
 ;
run;

data b;
 input x$ y;
 cards;
 x 10
 y 2
 z 30
 ;
run;


data c;
 set a b;
run;

data b;
 input z$ u;
 cards;
 x 10
 y 2
 z 30
 ;
run;


data c;
set a;
set b;
run;

****quiz***;

data a;
 do x=1 to 6;
  output;
 end;
run;

data b;
 do i=1 to 6;
  set a;
  output;
 end;
 drop i;
run;

data b;
 do i=1 to 6;
  put _all_;
  set a;
  output;
 end;
 drop i;
run;

data b;
 do i=1 to 7;
  put _all_;
  set a;
  output;
 end;
 drop i;
run;

data _null_;
 do i=1 to 8;
  set a;
  put _all_;
  do j=1 to 4;
   set a;
   put _all_;
  end;
 end;
run;

data _null_;
 do i=1 to 2;
  set a;
  put _all_;
  do j=1 to 3;
   set a;
   put _all_;
  end;
 end;
run;


data c;
 set a;
 set a;
run;

data c;
 set a a;
run;

data b;
 set a;
 output;
 k=1;
 set a point=k;
 output;
run;


data a;
 input x$ y;
 cards;
a 1
b 2
c 3
d 4
;
run;

data b;
 input u v @@;
 cards;
 1 2 3 4 5 6
 ;
run;

data c;
 merge a b;
run;

data c1;
 set a b;
run;

data c2;
 set a;
 set b;
run;

data c;
 merge b a;
run;

data d;
 input x1$ y1;
 cards;
a 1
b 2
c 3
d 4
;
run;

data e;
 input u1 v1 @@;
 cards;
 1 2 3 4 5 6
 ;
run;


data c1;
 merge a b;
 merge d e;
run;

data c2;
 merge a b d e;
run;

proc compare base=c1 compare=c2;
run;


data a;
 input x$ y;
 cards;
 a 10
 b 20
 b 30
 c 90
 ;
run;

data b;
 input x$ z;
 cards;
 a 5
 b 7 
 z 8
 ;
run;

data c;
 merge a b;
run;

data c;
 merge b a;
run;

data c;
 merge b a (rename =(x=x_a));
run;

data a;
 input x$ y;
 cards;
 a 10
 b 20
 c 80
 ;
run;

data b;
 input x$ z;
 cards;
 a 6
 b 3
 z 8
 ;
run;

data c;
 merge a b;
 by x;
run;

data a;
 input x$ y;
 cards;
 a 10
 b 20
 b 30
 c 80
 ;
run;

data c;
 merge a b;
 by x;
run;


data b;
 input x$ z;
 cards;
 a 6
 b 3
 b 4
 z 8
 ;
run;

data c;
 merge a b;
 by x;
run;

data b;
 input x$ z;
 cards;
 a 6
 b 3
 b 4
 b 8
 z 8
 ;
run;


data c;
 merge a b;
 by x;
run;


data c;
 set a (in=in_a) b (in=in_b);
run;

data c;
 set a (in=in_a) b (in=in_b);
 in_aa=in_a;
 in_bb=in_b;
run;

data c;
 merge a (in=in_a) b (in=in_b);
 by x;
 in_aa=in_a;
 in_bb=in_b;
run;

data a;
 input x$ y;
 cards;
 A 1
 B 2
 ;
run;

data b;
 input u v;
 cards;
 10 20
 30 40
 ;
run;

proc sql;

select *
from a,b
;

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
from a,b
where a.x=b.x
;

create table c as
select *
from a,b
where a.x=b.x
;

data a;
 input x$ y;
 cards;
A 1
A 2
B 2
;
run;

data b;
 input x$ v;
 cards;
A 20
A 22
A 40
X 100
;
run;

proc sql;
select a.x,y,v
from a,b
where a.x=b.x
;
data c1;
merge a b;
by x;
run;

data c1;
merge a (in=in_a) b(in=in_b);
by x;
if in_a and in_b;
run;

data a;
 input id x;
 cards;
 1 100
 2 200
 3 100
 4 200
 5 300
 ;
run;

data b;
 input id y;
 cards;
 1 10
 2 20
 3 10
 4 20
 5 30
 ;
run;

proc sql;
 select *
 from (select * 
		from a
		where x>=200) as p, b
 where p.id=b.id
 ;

 *outer joins;

 data a;
  input x$ y;
  cards;
  A 1
  B 2
  ;
run;

data b;
 input x$ v;
 cards;
 A 20
 C 22
 X 50
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


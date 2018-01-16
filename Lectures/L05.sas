data a;
 do id='A', 'B', 'C';
  do x=1 to 4;
   y=floor(10*ranuni(0));
   output;
  end;
 end;
run;

proc sql;
select y
from a
where y>(
			select avg(y)
			from a
		)
	;

select *
from a
group by x
having y>avg(y)
;


select *
from a as first
where y> (select avg(y)
			from a as sec
			where sec.x=first.x
			)
	;

data z;
 input x$ y;
 cards;
 A 3
 A 2
 A 1
 B 1
 B 2
 C 1
 C 2
 C 3
 D 0
 ;
 run;

 proc sql;

 select x,(select max(y) from z as b where a.x=b.x) as max
  from z as a
; 

 select distinct x,(select max(y) from z as b where a.x=b.x) as max
  from z as a
; 

select x
from z
group by x
having (max(y)-min(y))=max(
							(select (max(y)-min(y))
								from z
								group by x
							)

						)
;

select x
from z
group by x
having (max(y)-min(y))=max(
							(select (max(y)-min(y))
								from z
								/*group by x*/
							)

						)
;

select x
from z
group by x
having (max(y)-min(y))>=all(
							(select (max(y)-min(y))
								from z
								group by x
							)

						)
;

/*
SELECT
FROM
WHERE
GROUP BY
HAVING
ORDER BY
*/

describe table sashelp.fish;

/*****************8Joining data sets in 4GL*******************/

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
 y 3
 z 30
 u 40
 ;
run;


data c;
 set a b;
run;

data c;
 set b a;
run;


data c;
 put 'Before: ' _all_;
 set a b;
 put 'After: ' _all_;
run;

data a1;
 input x$ y z;
 cards;
A 1 1
B 2 2
C 3 3
;
run;


data c;
 put 'Before: ' _all_;
 set a1 b;
 put 'After: ' _all_;
run;

data c;
 put 'Before: ' _all_;
 set b a1;
 put 'After: ' _all_;
run;

proc append base=a data=b;
run;

proc append base=a1 data=b;
run;


proc append base=b data=a1;
run;

proc append base=b data=a1 force;
run;


proc append base=d data=a1;
run;

data z1;
 input x $ y;
 cards;
 1 1
 2 2
 3 3
 ;
run;

data z2;
 input x y;
 cards;
 4 13
 5 23
 6 35
 ;
run;

proc append base=z1 data=z2;
run;


proc append base=z1 data=z2 force;
run;

proc append base=z2 data=z1 force;
run;


data a;
 input x $ y;
 cards;
 a 10
 b 20
 b 30
 c 80
 ;
run;

data b;
input x $ z;
 cards;
a 5
b 7
z 8
;
run; 

data c;
 set a b;
 by x;
run;

data c;
 set b a;
 by x;
run;


data c;
 set b a;
 by x;
 fx=first.x;
 lx=last.x;
run;

data c;
 put 'Before ' _all_; 
 set a b;
 by x;
 put 'After ' _all_;
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
 set a;
 set b;
run;

data c;
 set a b;
run;


data c;
 set b;
 set a;
run;

data c;
 put 'first: ' _all_;
 set b;
 put 'second: ' _all_;
 set a;
 put 'third: ' _all_;
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

 data b;
 input x$ z;
 cards;
 a 3
 b 7
 z 2
  ;
 run;

data c;
  set a;
  set b;
run;


data c;
  set b;
  set a;
run;


data c;
 put 'first: ' _all_;
 set b;
 put 'second: ' _all_;
 set a;
 put 'third: ' _all_;
run;

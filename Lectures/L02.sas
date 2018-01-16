data a;
 do i=1 to 10;
  x=.;
  output;
 end;
run; 

data _null_;
 set a end=done;
 sum_x=sum_x+x;
 sum_i=sum_i+i;
 if done then put sum_x= sum_i=;
run;

data _null_;
 set a end=done;
 sum_x=sum(sum_x,x);
 sum_i=sum(sum_i,i);
 if done then put sum_x= sum_i=;
run;

data _null_;
 retain sum_x 0 sum_i 0;
 set a end=done;
 sum_x=sum(sum_x,x);
 sum_i=sum(sum_i,i);
 if done then put sum_x= sum_i=;
run;

data a;
 do i=20 to 1 by (-1);
  output;
 end;
run;

data a;
 do w='Alpha','Beta','Gamma';
  x=ceil(100*ranuni(0));
  output;
 end;
run;

data a;
 do i=1 to 10;
 end;
run;

data a;
 do i=1 to 10;
  x=i;
 end;
run;

data a;
 do i=1 to 10;
  x=i;
  output;
 end;
run;

*do while;

data _null_;
 do while (n<=3);
  put n=;
  n+1;
 end;
run;


data _null_;
 do while n<=3;
  put n=;
  n+1;
 end;
run;

data _null_;
 do until (n<=3);
  put n=;
  n+1;
 end;
run;

data a;
 do i=1 to 10;
  output;
 end;
run;

data b;
 set a;
 if i=2 then i=200;
  else if i=3 then i=300;
run;

data b;
 set a;
 if i=2 then do;
	i=200;
	x=9;
 end;
  else if i=3 then i=300;
run;

data _null_;
 set a;
 select;
  when (i=1) do;
  		put i=;
		put 'YES';
  end;
  when (i=2) put 'NO';
  otherwise put 'NONONONO';
 end;
run;

data _null_;
 set a;
 select(i);
  when (1) do;
  		put i=;
		put 'YES';
  end;
  when (2) put 'NO';
  otherwise put 'NONONONO';
 end;
run;

data a;
 do x=1 to 10;
  output;
 end;
run;

data b;
 set a;
 if (x-lag(x)=1) then x=x+1;
run;

data b;
 set a;
 if (x-lag(x)=1) then do;
				x=x+1;
				y=lag(x);
 end;
run;

data e;
 set a;
 if not (x=.) then new=x;
 put new=;
run;

data e;
 set a;
 if not x=. then new=x;
 put new=;
run;


data e;
 set a;
 y= not x;
 put new=;
run;


data a;
 do x='a','b','c';
  do y='AA','BB','CC';
   z=floor(10*ranuni(0));
   u=floor(10*ranuni(0));
   output;
  end;
 end;
run;

data b;
 set a;
 by x;
run;

data b;
 by x;
 set a;
run;

data b;
 set a;
 by x;
 f_x=first.x;
 l_x=last.x;
run;


data b;
 set a;
 by x y;
 f_x=first.x;
 l_x=last.x;
 f_y=first.y;
 l_y=last.y;
run;

data b;
 set a;
 by z;
run;

data d;
 input x y;
 cards;
 2 3
 23 25
 23 22
 2 4
 23 22
 1 2
 1 2
 ;
run;

proc sort data=d out=ds;
 by x;
run; 

proc sort data=d out=ds;
 by descending x;
run; 

proc sort data=d out=ds nodup;
 by x;
run; 

proc sort data=d out=ds nodupkey;
 by x;
run; 

data a;
 input x y;
 cards;
 1 2
 0 2
 1 3
 1 2
 9 8
 ;
run;

proc sort data=a out=as nodup;
 by x;
run; 


proc sort data=a out=as nodup;
 by x y;
run; 

proc sort data=as;
 by x;
run;

proc contents data=as out=info;
run;

data a;
 do i=20 to 1 by (-1);
  do j=1 to 5;
   x=ranuni(0);
   output;
  end;
 end;
 drop j;
run;

data b;
 set a;
 by i;
run;

data b;
 set a;
 by descending i;
run;

data a;
 input x1 x2 x3 x4 x5;
 cards;
 1 2 3 4 5
 3 4 5 7 8
 2 3 5 7 8
 ;
run;

data a100;
set a;
x1=x1+100;
x2=x2+100;
x3=x3+100;
x4=x4+100;
x5=x5+100;
run;

data a100;
set a;
do i=1 to 5;
 xi=xi+100;
 output;
end;
run;

data a100;
set a;
do i=1 to 5;
 x(i)=x(i)+100;
 output;
end;
run;


data a100;
 set a;
 array variables(*) x1-x5;
 do j=1 to dim(variables);
  variables(j)=variables(j)+100;
 end;
 drop j;
run;

data a;
 array z {3}$ z1 a u ('a','b','c');
run;

data a;
 do x=1 to 5;
  output;
 end;
run;

data b;
 set a;
 array tab(3) (3*7);
run;

data b;
 set a;
 array tab(3) (3*7);
 if _n_=2 then do;
  do j=1 to dim(tab);
   tab(j)=8;
  end;
 end;
drop j;
run;


data b;
 set a;
 array tab(3);
 if _n_=2 then do;
  do j=1 to dim(tab);
   tab(j)=8;
  end;
 end;
drop j;
run;

data a;
 array temp(10) _temporary_;
  do i=1 to dim(temp);
   temp(i)=5*i;
  end;
run;

data a;
 array temp(10) _temporary_;
  do i=1 to dim(temp);
   temp(i)=5*i;
  end;
 do i=1 to dim(temp);
  x=temp(i);
  output;
 end;
run;

data a;
 input x;
 cards;
 1
 2
 3
 ;
run;

data b;
 set a;
 array t(*) _all_;
 r=dim(t);
run;

data b;
 set a;
 z=3;
 array t(*) _all_;
 r=dim(t);
run;


data b;
 z=3;
 set a;
 array t(*) _all_;
 r=dim(t);
run;

data b;
 z=3;
 array t(*) _all_; *_char_ _num_;
 set a;
 r=dim(t);
run;

data a;
 x1=1; x2=2; x3=3; y7=70; y8=80; y9=90;
 format x1-x3 words.;
 format y7-y8 roman.;
 format y9 2.;
run;

data b;
 set a (keep=x1-x3);
 sum=sum(of x2-x3);
run;

data a;
input id name $ x y z;
cards;
1 Barbie 2 3 4
2 Ken 3 4 5
;
run;

data b;
 set a (keep=x--z);
run;

data b;
 set a (keep=name--y);
run;
  
data b;
 set a (keep=id-numeric-x);
run;

data a;
x_a=1;x_b=2;xx=3;x1=5;y=2;
output;
run;
  
data b;
 set a (keep=x:);
 z=sum(of x:);
run;

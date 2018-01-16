data a;
 x=2;
run;

data a;
 x=2
run;

data a;
 x=5;
 asdasda;
run;

data a;
 x=2;
 y=7.5;
 z='asd';
run;

data a;
 x=2;
 y=7.5;
 z="asd";
run;

data a;
 x=5;
 x=200;
run;

data a;
 x=5;
 output;
 x=200;
 output;
run;

data a;
 x=5;
 output;
 x=200;
run;


data a;
 x=5;
 y=7;
 output;
 x=200;
 y=100;
 output;
run;

data b;
 do i=1 to 10;
  x=floor(100*ranuni(0));
  output;
 end;
run;

data b;
 do i=1 to 10;
  x=floor(100*ranuni(0));
 end;
run;

data b;
 do i=2 to 10;
  x=floor(100*ranuni(0));
 end;
run;


data b;
 do i=1 to 10;
  x=floor(100*ranuni(0));
  output;
 end;
run;


data c;
 set b;
 x=x+100;
run;

*implicit loop;

data c;
 set b;
 x=x+100;
 n=_N_;
run;

data c;
 set b;
 x=x+100;
 if x>120 then u=1;
run;

data c;
 set b;
 if _n_=1 then u=5;
 x=x+100;
run;

data a;
 x=1;
 y=2;
 put _all_;
 output;
 x=2;
 put _all_;
 output;
run;

data a;
 do i=1 to 10;
  x=i;
  output;
 end;
 keep x;
run;

data a;
 do i=1 to 10;
  x=i;
  output;
 end;
 drop i;
run;

data b;
 set a;
 if mod(x,2)=0 then v=v+1;
run;

data b;
 v=0;
 set a;
 if mod(x,2)=0 then v=v+1;
run;

data b;
 if _n_=1 then v=0;
 set a;
 if mod(x,2)=0 then v=v+1;
run;

data b;
 retain v 0;
 set a;
 if mod(x,2)=0 then v=v+1;
run;

data b;
 set a;
 if mod(x,2)=0 then v+1;
run;

data b;
 set a end=e;
 if mod(x,2)=0 then v+1;
 if e=1 then put 'Number of even: ' v;
run;

data b;
 set a end=e;
 r=e;
run;

data a;
x=1;output;
x=2;output;
x=3;output;
run;

data b;
 set a;
 y=x*20;
run;


data b;
 put 'First PUT ' _all_;
 set a;
 put 'Second PUT ' _all_;
 y=x*20;
 put 'Third PUT ' _all_;
run;

data b;
output;
set a;
x=x*5;
run;

data b;
if _n_>1 then output;
set a;
x=x*5;
run;

data b;
*if _n_>1 then output;
set a;
x=x*5;
run;

data a;
 do x=1 to 5; output; end;
run;

data b;
 set a;
 y=lag(x);
run;

data b;
 set a;
 y=lag2(x);
run;

data b;
 set a;
 y=dif(x);*dif(x)=x-lag(x)
run;

data b;
 set a;
 y=dif2(x);
run;


data a;
 do x=1 to 20; output; end;
run;

data b;
 set a;
 l1=lag(x);
 l2=lag2(x);
run;

data b;
 set a;
 if mod(x,2)=0 then x2=lag(x);
run;

data b;
 set a;
 if mod(x,2)=0 then x2=lag(x);
 if mod(x,5)=0 then x5=lag(x);
run;

*if lag(x)<3?;




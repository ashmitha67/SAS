data a;
 do i=1 to 10;
  put i=;
 end;
run;


data a;
 do i=1 to 10;
  if i=5 then continue;
  put i=;
 end;
run;

data a;
 do i=1 to 10;
  if i=5 then leave;
  put i=;
 end;
run;


data a;
 x=5;
 y='6';
run;

data a;
 x=5;
 y='6';
 z=x+y;
run;

data a;
 x=5;
 y='6';
 z=x||y;
run;

data a;
 x=22.34;
 y='125.45';
 z1=put(x,5.2);
 z2=input(y,6.2);
run;

data a;
 x=0.45;
 format x fract.;
 x1=put(x,fract.);
run;

data a;
 x='08Mar2017';
 x1=input(x,date9.);
run;

data a;
 x=0.45;
 format x fract.;
run;

data b;
 set a;
run;

data _null_;
 x='08Mar2017'd;
 put x;
run;


data _null_;
 x='08Mar2017'd;
 put x ddmmyy8.;
run;



data a;
 do i=1 to 100;
  output;
 end;
run;

option firstobs=3 obs=7;

data b;
 set a;
run;

option firstobs=1 obs=max;

data b;
 set a;
run;

data b;
 set a;
 where mod(i,2)=0;
 put _all_;
run;


data b;
 set a;
 if mod(i,2)=0;
 put _all_;
run;


data b;
 set a;
 put _all_;
 if mod(i,2)=0;
 put _all_;
run;

data b;
 set a;
 x=2*i;
 if x>5;
run;


data b;
 set a;
 x=2*i;
 where x>5;
run;

data a;
 do i=1 to 9;
  output;
 end;
run;

data b;
 set a end=done;
 where mod(i,2)=0;
 if done then output;
run;

data b;
 set a end=done;
 if mod(i,2)=0;
 if done then output;
run;

data b;
 set a end=done;
 if mod(i,2)=1;
 if done then output;
run;

data a;
 do i=1 to 9;
  x=2*i;
  output;
 end;
run;



data b;
 set a (where=(x>4) keep=x);
run;


data b (where=(x>4) keep=x);
 set a ;
run;


data c;
 num=3;
 set a point=num;
 put _all_;
run;

data c;
 num=3;
 set a point=num;
 put _all_;
 stop;
run;

data c;
 num=3;
 set a point=num;
 put _all_;
 output;
 stop;
run;

data c;
 output;
 set a point=num;
 put _all_;
 stop;
run;

data c;
 set a point=num;
 num=3;
 put _all_;
 output;
 stop;
run;


data c;
 set a point=3;
 put _all_;
 output;
 stop;
run;

data c;
 do num=3,5,7;
  set a point=num;
  output;
 end;
 stop;
run;

data c;
 do num=3,5,7;
  set a point=num;
  put _all_;
  output;
 end;
 stop;
run;

data c;
 put _all_;
 if num=7 then stop;
 do num=3,5,7;
  set a point=num;
  output;
 end;
run;

data b;
 set a nobs=n;
 if _n_=n then output;
run;

data b;
 set a nobs=n;
 k=n ;
run;

data b;
 k=n;
 if _n_=1 then put k=;
 set a nobs=n;
run;

data b;
 k=n;
 if _n_=1 then put k=;
 stop;
 set a nobs=n;
run;

data a;
 do x=1 to 10;
  output;
 end;
run;

data b;
 do k=nn to 1 by (-1);
  set a nobs=nn point=k;
  output;
 end;
 stop;
run; 

data b;
 k=40;
 set a point=k;
 output;
 stop;
run;

data b;
 do k=1,40;
 set a point=k;
 output;
 if _error_=1 then stop;
 end;
run;

data b;
 PUT _all_;
 do k=1,2,3;
  set a point=k;
  output;
 end;
 stop;
run;

data b;
 put _all_;
 k=_n_;
 set a point=k;
 if k>3 then stop;
run;

data b;
 put _all_;
 num=3*(_n_-1)+1;
 set a point=num nobs=k;
 if num>k then stop;
run;

data b;
 put _all_;
 num=3*(_n_-1)+1;
 if num>k then stop;
 set a point=num nobs=k;
run;

data b;
* put _all_;
 num=3*(_n_-1)+1;
 if num>k then stop;
 set a point=num nobs=k;
run;

data a;
 do i=1to 10; 
  output;
 end;
run;

data b;
 num=3*(_n_-1)+1;
 if num<=k then set a point=num nobs=k;
run;

data a;
 do x=1 to 3;
  output;
 end;
run;

data b;
 if x=1 then set a;
run;

data b;
 if x ne 1 then set a;
run;

data b;
 put _all_;
 if x ne 1 then set a;
run;

data b;
 if x ne 4 then set a;
run;



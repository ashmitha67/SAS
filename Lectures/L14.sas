data participants;
 input name $ gender:$1. treatment $;
 datalines;
 John M Plecebo
 Ronald M Drug-A
 Barbara F Drug-B
 Alice F Drug-A
 ;
run;

data results(drop=i);
 input date:date9. @;
 do i=1 to 5;
 input name $ result @;
 output;
 end;
 datalines;
 05May2006 Barbara 123 Alice 277 Ronald 180 John 111 Mike 123
 04Jun2006 Barbara 122 Alice 177 Ronald 144 John 144 Mike 126
 ;
run;

data join;
 length name treatment $ 8 gender  $ 1;
 if _N_=1 then do;
  declare hash h(dataset:'participants');
  h.defineKey('name');
  h.defineData('gender','treatment');
  h.defineDone();
 end;
 set results;
  if h.find()=0 then output;
run;

data join;
 length name treatment $ 8 gender  $ 1;
 if _N_=1 then do;
  declare hash h(dataset:'participants');
  h.defineKey('name');
  h.defineData('gender','treatment');
  h.defineDone();
 end;
 set results;
  /*if h.find()=0 then output;*/
run;

data join;
 length name treatment $ 8 gender  $ 1;
 if _N_=1 then do;
  declare hash h(dataset:'participants');
  h.defineKey('name');
  h.defineData('gender','treatment');
  h.defineDone();
 end;
 set results;
   h.find();
run;


data participants;
 input name $ gender:$1. treatment $;
 datalines;
 John M Drug-C
 John M Plecebo
 Ronald M Drug-A
 Barbara F Drug-B
 Alice F Drug-A
 ;
run;

data join;
 length name treatment $ 8 gender  $ 1;
 if _N_=1 then do;
  declare hash h(dataset:'participants');
  h.defineKey('name');
  h.defineData('gender','treatment');
  h.defineDone();
 end;
 set results;
  if h.find()=0 then output;
run;


data join;
* length name treatment $ 8 gender  $ 1;
 if _N_=1 then do;
  declare hash h(dataset:'participants');
  h.defineKey('name');
  h.defineData('gender','treatment');
  h.defineDone();
 end;
 set results;
  if h.find()=0 then output;
run;


data join;
 length name treatment $ 8 gender  $ 1;
 if _N_=1 then do;
  declare hash h(dataset:'participants');
  h.defineKey('name');
  h.defineData('gender','treatment');
  h.defineDone();
  call missing(treatment,gender);
 end;
 set results;
  if h.find()=0 then output;
run;

data join;
 length name treatment $ 8 gender  $ 1;
 gender='X';
 treatment='kill';
 if _N_=1 then do;
  declare hash h(dataset:'participants');
  h.defineKey('name');
  h.defineData('gender','treatment');
  h.defineDone();
 end;
 set results;
  if h.find()=0 then output;
run;


data join;
 length name treatment $ 8 gender  $ 1;
 if _N_=1 then do;
  declare hash h(dataset:'participants');
  h.defineKey('name');
  h.defineData('gender','treatment');
  h.defineDone();
 end;
 set results;
  if h.find()=0 then do;
  	gender='X';
 	treatment='kill';
	output;
  end;
run;

data join;
 length name treatment $ 8 gender  $ 1;
 gender='X';
 treatment='kill';
 if _N_=1 then do;
  declare hash h(dataset:'participants');
  h.defineKey('name');
  h.defineData('gender','treatment');
  h.defineDone();
 end;
 set results;
  if h.find=0 then output;
run;


data join;
 length name treatment $ 8 gender  $ 1;
 gender='X';
 treatment='kill';
 if _N_=1 then do;
  declare hash h(dataset:'participants');
  h.defineKey('name');
  h.defineData('gender','treatment');
  h.defineDone();
 end;
 set h.find;
run;


data goals;
 input player $ when & $9.;
 datalines;
 Hill 1st 01:24
 Jones 1st 09:43
 Santos 1st 12:45
 Santos 2nd 00:42
 Santos 2nd 03:46
 Jones 2nd 11:15
 ;
run;

data _null_;
 length goals_list $ 64;
 if _N_ = 1  then do;
  declare hash h();
  h.defineKey('player');
  h.defineData('player','goals_list');
  h.defineDone();
 end;
 set goals end=done;
 if h.find()^=0 then do;
  goals_list= when;
  h.add();
 end;
 else do;
  goals_list = trim(goals_list) || ', ' || when;
  h.replace();
 end;
 if done then h.output(dataset:'goal_summary');
run;

data _null_;
 length goals_list $ 64;
 if _N_ = 1  then do;
  declare hash h();
  h.defineKey('player');
  h.defineData(/*'player',*/'goals_list');
  h.defineDone();
 end;
 set goals end=done;
 if h.find()^=0 then do;
  goals_list= when;
  h.add();
 end;
 else do;
  goals_list = trim(goals_list) || ', ' || when;
  h.replace();
 end;
 if done then h.output(dataset:'goal_summary');
run;

data _null_;
 length goals_list $ 64;
 if _N_ = 1  then do;
  declare hash h(ordered:'d');
  h.defineKey('player');
  h.defineData('player','goals_list');
  h.defineDone();
 end;
 set goals end=done;
 if h.find()^=0 then do;
  goals_list= when;
  h.add();
 end;
 else do;
  goals_list = trim(goals_list) || ', ' || when;
  h.replace();
 end;
 if done then h.output(dataset:'goal_summary');
run;

data _null_;
 length goals_list $ 64;
 if _N_ = 1  then do;
  declare hash h(ordered:'a');
  h.defineKey('player');
  h.defineData('player','goals_list');
  h.defineDone();
 end;
 set goals end=done;
 if h.find()^=0 then do;
  goals_list= when;
  h.add();
 end;
 else do;
  goals_list = trim(goals_list) || ', ' || when;
  h.replace();
 end;
 if done then h.output(dataset:'goal_summary');
run;

data _null_;
 length goals_list $ 64;
 if _N_ = 1  then do;
  declare hash h(ordered:'a');
  h.defineKey('player');
  h.defineData('player','goals_list');
  h.defineDone();
 end;
 set goals end=done;
  goals_list= when;
  h.add();
  if done then h.output(dataset:'goal_summary');
run;

data _null_;
 length goals_list $ 64;
 if _N_ = 1  then do;
  declare hash h(ordered:'a');
  h.defineKey('player');
  h.defineData('player','goals_list');
  h.defineDone();
 end;
 set goals end=done;
  goals_list= when;
  u=h.add();
  put u=;
  if done then h.output(dataset:'goal_summary');
run;

data class_scores;
 input name :$9. score @@;
 datalines;
 Callum 89 Chyou 92
 Damien 89 Grace 74
 Jorge 99 Kyle 85
 Lachlan 83 Laucia 90
 Mia 91 Niamh 80
 Philipp 89 Tomas 76
 ;
run;

data top_quarter bottom_quarter;
length name $9 score 8;
keep name score;
if _N_=1 then do;
 declare hash h(dataset: 'class_scores', ordered: 'descending');
 h.defineKey('score','name');
 h.defineData('score','name');
 h.defineDone();
 call missing(name, score);
 declare hiter hi('h');
end;
count=h.num_items;
n=int(count* .25);
hi.first();
 do i=1 to n;
	output top_quarter;
	hi.next();
 end;
hi.last();
 do i=1 to n;
  output bottom_quarter;
  hi.prev();
 end;
run;

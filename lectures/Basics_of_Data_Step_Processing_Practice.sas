


data	scores1_copy;
set		data2.scores1;
run;


data	scores1_mod (rename=(score=Final_Score));
set		data2.scores1 (keep=school score);
where (school="MET");
run;



*original code ;
data	occupancy;
Creatures = residents + dogs;
set		data1.occupancy (drop=residents smokers dogbreed dogs);
run;


*debuged code ;
data	occupancy (keep=creatures);
set		data1.occupancy (drop=smokers dogbreed);
Creatures = residents + dogs;
run;

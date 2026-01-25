/* Objective function */
max: +262 timesTaken_v1_v2;

/* Constraints */
-timesTaken_v2_v0 +timesTaken_v0_v1 = 0;
-timesTaken_v0_v1 +timesTaken_v1_v2 = 0;
+timesTaken_v2_v0 -timesTaken_v1_v2 = 0;
0 timesTaken_v0_v0 = 0;
0 timesTaken_v0_v0 = 0;
R6: +timesTaken_v0_v1 = 1;
R7: +timesTaken_v0_v0 = 0;
R8: -writebacks = 0;
R9: -dirtifyingStores >= 0;
-writebacks +dirtifyingStores >= 0;

/* Integer definitions */
int timesTaken_v0_v0,timesTaken_v2_v0,timesTaken_v0_v1,timesTaken_v1_v2,writebacks,dirtifyingStores;

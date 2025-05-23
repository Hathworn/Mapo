#include "hip/hip_runtime.h"
#include "includes.h"

//Problem Parameters
#define CITIES 100
#define ANTS 2000
#define MAX_DIST 100
#define ALPHA 1
#define BETA 5       //This parameter raises the weight of distance over pheromone
#define RHO 0.5      //Evapouration rate
#define QVAL 100     //
#define MAX_TOURS 50// The number of times an ant will walk trough all the cities
#define INIT_PHER (1.0/CITIES) //Initial hormone for each path
#define MAX_TOTAL_DISTANCE (CITIES * MAX_DIST) // MAX possible distance that an ant can walk


struct ant{
int curCity, nextCity, pathIndex;
int visited[CITIES];
int path[CITIES];
float tourLength;
};

//CPU
float        distances[CITIES][CITIES]; // Distance between city i an j
double       hormone[CITIES][CITIES]; //Hormone between city i and j
struct ant   ants[ANTS];
float        bestdistance[ANTS];
float 		 finalbest = (float)MAX_TOTAL_DISTANCE;
hiprandState  state[ANTS];
const size_t distances_size = sizeof(float) * size_t(CITIES*CITIES);
const size_t hormone_size = sizeof(double) * size_t(CITIES*CITIES);
//GPU
float        *distances_d;
struct ant   *ants_d;
double       *hormone_d;
float        *bestdistance_d;
hiprandState  *state_d;
int BLOCKS,THREADS;

void get_distances_matrix();
void deviceAlloc();


__global__ void restart_ants(struct ant *ants_d,hiprandState *state_d, float *bestdistance_d , int THREADS){

int position = threadIdx.x + blockIdx.x*THREADS;
int i;

if(ants_d[position].tourLength < bestdistance_d[position]){
bestdistance_d[position] = ants_d[position].tourLength;
}

ants_d[position].nextCity = -1;
ants_d[position].tourLength = 0.0;

for(i = 0; i < CITIES; i++){
ants_d[position].visited[i] = 0;
ants_d[position].path[i] = -1;
}

ants_d[position].curCity = hiprand(&state_d[position])% CITIES;
ants_d[position].pathIndex = 1;
ants_d[position].path[0] = ants_d[position].curCity;
ants_d[position].visited[ants_d[position].curCity] = 1;
}
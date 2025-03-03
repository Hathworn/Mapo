#include "hip/hip_runtime.h"
#include "includes.h"
#define N 50
#define NewN 100

#define LifeN 500
#define numofthreads 512
int numofeles=0,capacity;

struct chromosome
{
long long weight=0, value=0;
bool chromo[100003];
};
chromosome chromoele[N],*cudaChromo,*cudaNewpopulation,newpopulation[NewN],res,x[2];
int weight[100001],value[100001],*devValue,*devWeight,*devnumeles;
__global__ void hybrid(chromosome *cudaChromo, chromosome *cudaNewpopulation, int seed1, const int numele, int *devValue, int *devWeight)
{

int idx = threadIdx.x + blockIdx.x*blockDim.x;
if (idx < NewN){
hiprandState state;
hiprand_init(seed1, idx, seed1, &state);
int seed2 = hiprand(&state) % N;
hiprand_init(seed1, idx, seed1, &state);
int seed3 = hiprand(&state) % numele;
cudaNewpopulation[idx] = cudaChromo[idx%N];

if (idx <NewN-N){

cudaNewpopulation[idx].value -= devValue[seed3] * (cudaNewpopulation[idx].chromo[seed3] ? 1 : 0);
cudaNewpopulation[idx].weight -= devWeight[seed3] * (cudaNewpopulation[idx].chromo[seed3] ? 1 : 0);
cudaNewpopulation[idx].chromo[seed3] = cudaChromo[seed2].chromo[seed3];
cudaNewpopulation[idx].value += devValue[seed3] * (cudaNewpopulation[idx].chromo[seed3] ? 1 : 0);
cudaNewpopulation[idx].weight += devWeight[seed3] * (cudaNewpopulation[idx].chromo[seed3] ? 1 : 0);
}
else{

cudaNewpopulation[idx].chromo[seed3] = cudaNewpopulation[idx].chromo[seed3] ? false : true;
//printf("\n%d\n", idx);
cudaNewpopulation[idx].value += devValue[seed3] *(cudaNewpopulation[idx].chromo[seed3]? 1 : -1);
cudaNewpopulation[idx].weight += devWeight[seed3] * (cudaNewpopulation[idx].chromo[seed3] ? 1 : -1);
}

}
}
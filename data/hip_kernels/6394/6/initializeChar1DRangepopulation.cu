#include "hip/hip_runtime.h"
#include "includes.h"
__device__ float generateRandom( hiprandState* globalState)
{
//int ind = threadIdx.x;
hiprandState localState = globalState[0];
float RANDOM = hiprand_uniform( &localState );
globalState[0] = localState;
return RANDOM;
}
__device__ float generateRandomc( hiprandState* globalState)
{
//int ind = threadIdx.x;
hiprandState localState = globalState[0];
float RANDOM = hiprand_uniform( &localState );
globalState[0] = localState;
return RANDOM;
}
__global__ void initializeChar1DRangepopulation(char *population,int sizeofPopulation,int sizeofChormosome,hiprandState* globalState,int division,char* range){
int populationIndex =  blockIdx.x * blockDim.x + threadIdx.x;
if(populationIndex<(sizeofPopulation*sizeofChormosome)){
population[populationIndex]= range[(int) (generateRandomc(globalState)*sizeofChormosome)];
//printf("CUDA %d\n",population[populationIndex]);

}
__syncthreads();
}
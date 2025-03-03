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
__global__ void initializeChar1Dpopulation(char *population,int sizeofPopulation,int sizeofChormosome,hiprandState* globalState,int division){
int populationIndex =  blockIdx.x * blockDim.x + threadIdx.x;
if(populationIndex<(sizeofPopulation*sizeofChormosome)){
population[populationIndex]= (char) ((int) (generateRandomc(globalState)*2)+48);
//printf("CUDA %d\n",population[populationIndex]);

}
__syncthreads();
}
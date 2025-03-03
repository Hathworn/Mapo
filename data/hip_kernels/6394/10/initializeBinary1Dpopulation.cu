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
__global__ void initializeBinary1Dpopulation(int *population,int sizeofPopulation,int sizeofChormosome,hiprandState* globalState,int division){
int populationIndex =  blockIdx.x * blockDim.x + threadIdx.x;
if(populationIndex<(sizeofPopulation*sizeofChormosome)){
population[populationIndex]=(int) (generateRandom(globalState)*2);
//printf("CUDA %d\n",population[populationIndex]);

}
__syncthreads();
}
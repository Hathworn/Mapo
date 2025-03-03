#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel_initializeRand( hiprandState * randomGeneratorStateArray, unsigned long seed, int totalNumThreads)
{
int id = (blockIdx.x * blockDim.x) + threadIdx.x;
if( id >= totalNumThreads){
return;
}
hiprand_init( seed, id, 0, &randomGeneratorStateArray[id]);
}
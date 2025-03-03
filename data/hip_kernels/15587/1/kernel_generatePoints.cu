#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel_generatePoints( hiprandState * globalState, int* counts, int totalNumThreads)
{
int index = (blockIdx.x * blockDim.x) + threadIdx.x;
float x,y;
if(index >= totalNumThreads){
return;
}
hiprandState localState = globalState[index];
for(int i = 0; i < NUM_POINTS_PER_THREAD; i++)
{
x = hiprand_uniform( &localState);
y = hiprand_uniform( &localState);
if(x*x+y*y <=1){
counts[index]++;
}
}
globalState[index] = localState;
}
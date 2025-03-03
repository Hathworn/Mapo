#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void setup_kernel(hiprandState  *state, int *seeds, int n)
{
// Usual block/thread indexing...
int myblock = blockIdx.x + blockIdx.y * gridDim.x;
int blocksize = blockDim.x * blockDim.y * blockDim.z;
int subthread = threadIdx.z*(blockDim.x * blockDim.y) + threadIdx.y*blockDim.x + threadIdx.x;
int idx = myblock * blocksize + subthread;
if (idx < n){
hiprand_init(seeds[idx], idx, 0, &state[idx]);
}
return;
}
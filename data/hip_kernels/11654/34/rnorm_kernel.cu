#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void rnorm_kernel(hiprandState *state, float *vals, int n, float mu, float sigma)
{
// Usual block/thread indexing...
int myblock = blockIdx.x + blockIdx.y * gridDim.x;
int blocksize = blockDim.x * blockDim.y * blockDim.z;
int subthread = threadIdx.z*(blockDim.x * blockDim.y) + threadIdx.y*blockDim.x + threadIdx.x;
int idx = myblock * blocksize + subthread;

if (idx < n) {
vals[idx] = mu + sigma * hiprand_normal(&state[idx]);
}
return;
}
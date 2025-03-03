#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void refill_randoms(float *dRand, int N, hiprandState *states)
{
int i;
int tid = blockIdx.x * blockDim.x + threadIdx.x;
int nthreads = gridDim.x * blockDim.x;
hiprandState *state = states + tid;

for (i = tid; i < N; i += nthreads)
{
dRand[i] = hiprand_uniform(state);
}
}
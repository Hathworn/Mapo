#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void device_api_kernel(hiprandState *states, float *out, int N)
{
int i;
int tid = blockIdx.x * blockDim.x + threadIdx.x;
int nthreads = gridDim.x * blockDim.x;
hiprandState *state = states + tid;

hiprand_init(9384, tid, 0, state);

for (i = tid; i < N; i += nthreads)
{
float rand = hiprand_uniform(state);
rand = rand * 2;
out[i] = rand;
}
}
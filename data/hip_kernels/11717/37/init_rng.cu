#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void init_rng (hiprandState * states, int seed)
{
int tid = blockIdx.x * blockDim.x + threadIdx.x;
hiprand_init (seed, tid, 0, &states[tid]);
}
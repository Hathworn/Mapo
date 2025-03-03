#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void init_prng(hiprandState *states, const unsigned long int seed)
{
const int t_idx = threadIdx.x;
hiprand_init(seed, t_idx, 0, &states[t_idx]);
}
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void init( unsigned int seed, hiprandState_t *d_state)
{
    // Calculate global thread index once and reuse
    int idx = threadIdx.x + blockDim.x * blockIdx.x;
    
    hiprand_init(
        seed,
        idx,
        0,
        &d_state[idx]);
}
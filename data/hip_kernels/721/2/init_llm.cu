#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void init( unsigned int seed, hiprandState_t *d_state)
{
    // Calculate thread global index once for efficiency
    unsigned int idx = threadIdx.x + blockDim.x * blockIdx.x;
    hiprand_init(seed, idx, 0, &d_state[idx]);
}
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void init_prng(hiprandState *states, const unsigned long int seed)
{
    // Use combined indexing to improve scalability beyond a single block
    const int t_idx = blockIdx.x * blockDim.x + threadIdx.x;
    hiprand_init(seed, t_idx, 0, &states[t_idx]);
}
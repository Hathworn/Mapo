#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void initilize(unsigned int seed, hiprandState_t *states)
{
    // Optimize by computing tid only once
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    // Initialize random state for each thread
    hiprand_init(seed, tid, 0, &states[tid]);
}
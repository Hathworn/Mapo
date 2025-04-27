#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void setup_rands(hiprandState* rand, unsigned long seed, unsigned long N)
{
    // Calculate global thread index more efficiently
    unsigned long tid = blockIdx.x * blockDim.x * blockDim.y + threadIdx.y * blockDim.x + threadIdx.x;

    // Initialize random state only if tid is within bounds
    if (tid < N) {
        hiprand_init(seed, tid, 0, &rand[tid]);
    }
}
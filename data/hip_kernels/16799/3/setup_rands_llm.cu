#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void setup_rands(hiprandState* rand, unsigned long seed, unsigned long N)
{
    // Calculating unique thread index in the grid
    unsigned long tid = blockIdx.x * blockDim.x + threadIdx.x + 
                        (blockIdx.y * blockDim.y + threadIdx.y) * gridDim.x * blockDim.x;

    // Ensure valid threads access
    if (tid < N) 
    {
        hiprand_init(seed, tid, 0, &rand[tid]);
    }
}
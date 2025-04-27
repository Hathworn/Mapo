#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize by ensuring state is initialized only for valid indices
__global__ void setup_kernel (hiprandState * state, unsigned long seed ){

    int i = blockDim.x * blockIdx.x + threadIdx.x;
    if (i < gridDim.x * blockDim.x) { // Ensure index is within valid range
        hiprand_init(seed, i, 0, &state[i]);
    }
}
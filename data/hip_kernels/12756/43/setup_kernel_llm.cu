#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void setup_kernel (hiprandState * state, unsigned long seed){

    // Calculate the unique thread index
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    
    /* Optimize kernel by eliminating branch divergence
       Check if thread index is within state size */
    if (i < gridDim.x * blockDim.x) {
        // Initialize the random state for each thread
        hiprand_init(seed, i, 0, &state[i]);
    }
}
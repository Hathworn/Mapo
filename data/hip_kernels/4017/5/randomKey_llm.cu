#include "hip/hip_runtime.h"
#include "includes.h"

// Kronecker product of two matrices kernel

__global__ void randomKey(size_t N, float *d_dst, unsigned long seed) {
    // Calculate global thread index
    int myId = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Only proceed if within bounds
    if (myId < N) {
        // Initialize random state with unique seed
        hiprandState state;
        hiprand_init(seed, myId, 0, &state);
        
        // Generate random number
        float randomVal = hiprand_uniform(&state);
        
        // Store random value in destination array
        d_dst[myId] = randomVal;
    }
}
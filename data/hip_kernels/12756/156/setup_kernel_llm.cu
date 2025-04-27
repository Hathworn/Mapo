#include "hip/hip_runtime.h"
#include "includes.h"

// Improved kernel function
__global__ void setup_kernel (hiprandState * state, unsigned long seed ){
    // Use shared memory for block-wise operations (if applicable to your use case)
    __shared__ hiprandState localState[256]; // Adjust size based on block dimension

    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Each thread initializes its own state in shared memory
    hiprand_init(seed, i, 0, &localState[threadIdx.x]);

    // Ensure all threads have finished initialization before copying to global state
    __syncthreads();

    // Copy initialized state to global memory
    state[i] = localState[threadIdx.x];
}
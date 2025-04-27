#include "hip/hip_runtime.h"
#include "includes.h"

// Improved kernel for random normal numbers generation
__global__ void rnorm_kernel(hiprandState *state, float *vals, int n, float mu, float sigma)
{
    // 1D block/thread indexing
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Process within bounds
    if (idx < n) {
        // Generate a normal random number and store it
        vals[idx] = mu + sigma * hiprand_normal(&state[idx]);
    }
}
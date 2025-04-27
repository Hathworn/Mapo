#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void kSetupCurand(hiprandState *state, unsigned long long seed) {
    // Use block-level parallelism for better performance
    const uint tidx = hipBlockDim_x * hipBlockIdx_x + hipThreadIdx_x;
    /* Each thread gets same seed, a different sequence number, no offset */
    hiprand_init(seed, tidx, 0, &state[tidx]);
}
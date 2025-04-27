#include "hip/hip_runtime.h"
#include "includes.h"

// Use a 1D block and grid for simplified indexing
__global__ void runif_kernel(hiprandState *state, float *vals, int n, float lo, float hi)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Compute global index
    if (idx < n) {
        vals[idx] = lo + (hi - lo) * hiprand_uniform(&state[idx]); // Generate random number
    }
}
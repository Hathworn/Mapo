#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void rexpo_kernel(hiprandState *state, float *vals, int n, float lambda) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Simplified 1D indexing

    // Ensure idx is within bounds and perform calculation
    if (idx < n) {
        vals[idx] = -log(hiprand_uniform(&state[idx])) / lambda;
    }
}
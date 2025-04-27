#include "hip/hip_runtime.h"
#include "includes.h"

// Load balance to improve warp efficiency by processing more elements per thread.
__global__ void uniformRandom(hiprandState_t *states, float *d_values) {
    int tid = threadIdx.x + blockDim.x * blockIdx.x;
    int totalThreads = gridDim.x * blockDim.x;

    // Process multiple elements per thread to reduce kernel launch overhead
    for (int i = tid; i < N; i += totalThreads) {
        d_values[i] = hiprand_uniform(&states[i]);
    }
}
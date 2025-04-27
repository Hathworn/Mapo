#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void setup_kernel(hiprandState *states, unsigned long seed) {
    // Calculate global thread id efficiently
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Initialize the RNG state for each thread
    hiprand_init(seed + tid, tid, 0, &states[tid]);
}
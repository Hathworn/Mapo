#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void saxpy_baseline(float* y, float* x, float a, clock_t * timer_vals)
{
    // Calculate the globally unique thread index
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Efficiently handle NUM_ITERS computation for each thread
    for (int i = 0; i < NUM_ITERS; i++) {
        unsigned int offset_idx = i * blockDim.x * gridDim.x + idx;
        y[offset_idx] = a * x[offset_idx] + y[offset_idx];
    }
}
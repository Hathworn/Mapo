#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void saxpy_optimized(float* y, float* x, float a, clock_t* timer_vals) {
    // Calculate global index once
    unsigned int tid = blockIdx.x * blockDim.x + threadIdx.x; 
    unsigned int stride = blockDim.x * gridDim.x;
    
    // Loop with stride to handle more elements
    for (int i = 0; i < NUM_ITERS; i++) {
        unsigned int idx = i * stride + tid;
        y[idx] = a * x[idx] + y[idx];
    }
}
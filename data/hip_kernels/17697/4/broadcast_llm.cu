#include "hip/hip_runtime.h"
#include "includes.h"

extern "C" {
}

__global__ void broadcast(const float* x, float* y, unsigned int c, unsigned int len) {
    // Calculate global thread ID using grid-stride loop
    for (int tid = blockIdx.x * blockDim.x + threadIdx.x; tid < len; tid += blockDim.x * gridDim.x) {
        // Efficient element assignment
        y[tid] = x[tid % c];
    }
}
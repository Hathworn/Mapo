#include "hip/hip_runtime.h"
#include "includes.h"
extern "C" {
}

__global__ void cross_entropy_backward(const float* __restrict__ x, float* __restrict__ dx, const float* __restrict__ t, const float* __restrict__ dy, unsigned int len) {
    // Calculate global thread ID
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    // Ensure thread is within bounds
    if (tid < len) {
        // Compute gradient
        dx[tid] = dy[0] * (x[tid] - t[tid]);
    }
}
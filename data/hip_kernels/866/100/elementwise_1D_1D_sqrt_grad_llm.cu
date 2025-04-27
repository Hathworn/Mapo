#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void elementwise_1D_1D_sqrt_grad(float* in_x, float* in_d, float* out_x, float* out_d, int size) {
    // Calculate unique thread ID
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    // Use stride to cover all elements
    int stride = blockDim.x * gridDim.x;

    // Iterate over elements with stride
    while (tid < size) {
        // Efficient element-wise computation
        in_d[tid] += out_d[tid] / (out_x[tid] * 2.0f);
        tid += stride;
    }
}
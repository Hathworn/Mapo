#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void elementwise_1D_1D_exp(float* in, float* out, int size) {
    // Compute the global thread ID
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Use blockDim.x for loop stride, improves memory access efficiency
    int stride = blockDim.x;

    // Changed loop condition to prevent unnecessary checks
    for (int i = tid; i < size; i += stride * gridDim.x) {
        out[i] = exp(in[i]);
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void saxpy_kernel_large(const float a, const float* x, const float* y, float* result, unsigned int len, unsigned int rowsz) {
    // Calculate index with grid stride loop
    unsigned int idx = threadIdx.x + blockIdx.x * blockDim.x + blockIdx.y * rowsz;
    unsigned int totalThreads = gridDim.x * blockDim.x;

    for (unsigned int i = idx; i < len; i += totalThreads) {
        result[i] = a * x[i] + y[i];
    }
}
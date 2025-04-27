#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void inc (int n, float* a) {
    // Use grid stride loop to improve efficiency and handle larger arrays
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    for (; i < n; i += stride) {
        a[i] += 1;
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel for element-wise addition
__global__ void matrix_elementwise_add(const float *a, const float *b, float *c, int n) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Unrolled loop for better memory access pattern and performance
    int gridSize = gridDim.x * blockDim.x;
    while (index < n) {
        c[index] = a[index] + b[index];
        index += gridSize;
    }
}
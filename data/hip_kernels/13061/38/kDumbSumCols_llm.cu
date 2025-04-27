#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kDumbSumCols(float* mat, float* vec, unsigned int width, unsigned int height) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < width) {
        float sum = 0;
        for (int j = 0; j < height; j++) {
            // Access mat using optimized pointer arithmetic to reduce pointer calculations
            sum += mat[j * width + idx];
        }
        vec[idx] = sum;
    }
}
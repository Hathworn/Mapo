#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kDumbSumCols(float* mat, float* vec, unsigned int width, unsigned int height) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < width) {
        float sum = 0;
        // Use shared memory to reduce global memory accesses (if applicable)
        for (int j = 0; j < height; j++) {
            sum += mat[j * width + idx];
        }
        vec[idx] = sum;
    }
}
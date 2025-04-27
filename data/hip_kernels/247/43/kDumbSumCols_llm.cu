#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kDumbSumCols(float* mat, float* vec, unsigned int width, unsigned int height) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < width) {
        float sum = 0;
        // Use a temporary pointer to avoid incrementing the original matrix pointer.
        float* matPtr = mat + idx; 
        for (int j = 0; j < height; j++) {
            sum += *matPtr;
            matPtr += width; // Move to the next element in the same column.
        }
        vec[idx] = sum;
    }
}
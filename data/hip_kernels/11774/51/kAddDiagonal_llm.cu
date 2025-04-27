#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kAddDiagonal(float* mat, float* vec, float* tgtMat, unsigned int width) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    // Loop with stride to utilize all threads efficiently
    for (unsigned int i = idx; i < width; i += stride) {
        tgtMat[width * i + i] = mat[width * i + i] + vec[i];
    }
}
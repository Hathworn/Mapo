```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kMultDiagonal(float* mat, float* vec, float* tgtMat, unsigned int width) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    if (idx < width) { // Ensure only necessary threads are used
        tgtMat[width * idx + idx] = mat[width * idx + idx] * vec[idx];
    }
}
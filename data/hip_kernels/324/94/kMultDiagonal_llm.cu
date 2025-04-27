#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kMultDiagonal(float* mat, float* vec, float* tgtMat, unsigned int width) {
    // Calculate the global index of the thread
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure index is within the matrix bounds
    if (idx < width) {
        tgtMat[width * idx + idx] = mat[width * idx + idx] * vec[idx];
    }
}
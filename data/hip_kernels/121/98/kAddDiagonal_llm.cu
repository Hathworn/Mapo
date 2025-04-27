#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kAddDiagonal(float* mat, float* vec, float* tgtMat, unsigned int width) {
    // Calculate unique index for this thread
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Process diagonal elements only if within matrix bounds
    if (idx < width) {
        tgtMat[width * idx + idx] = mat[width * idx + idx] + vec[idx];
    }
}
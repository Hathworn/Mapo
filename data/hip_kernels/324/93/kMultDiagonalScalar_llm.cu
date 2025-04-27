#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kMultDiagonalScalar(float* mat, float val, float* tgtMat, unsigned int width) {
    // Calculate thread index
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure index is within bounds and operate only on diagonal elements
    if (i < width) {
        unsigned int idx = width * i + i;
        tgtMat[idx] = mat[idx] * val;
    }
}
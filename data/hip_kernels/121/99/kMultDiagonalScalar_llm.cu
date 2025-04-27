#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kMultDiagonalScalar(float* mat, float val, float* tgtMat, unsigned int width) {
    // Optimize thread grid and loop iteration
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    if (idx < width) {
        tgtMat[width * idx + idx] = mat[width * idx + idx] * val;
    }
}
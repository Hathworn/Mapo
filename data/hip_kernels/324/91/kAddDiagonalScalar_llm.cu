#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kAddDiagonalScalar(float* mat, float val, float* tgtMat, unsigned int width) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int step = blockDim.x * gridDim.x;
    if (idx < width) { // Check if idx is within bounds
        for (unsigned int i = idx; i < width; i += step) {
            tgtMat[width * i + i] = mat[width * i + i] + val;
        }
    }
}
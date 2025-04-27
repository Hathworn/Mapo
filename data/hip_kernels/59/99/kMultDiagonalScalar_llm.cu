#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kMultDiagonalScalar(float* mat, float val, float* tgtMat, unsigned int width) {
    // Compute unique thread index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure only threads within matrix size execute
    if (idx < width) {
        tgtMat[width * idx + idx] = mat[width * idx + idx] * val;
    }
}
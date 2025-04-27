#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kAddDiagonalScalar(float* mat, float val, float* tgtMat, unsigned int width) {
    // Use a single loop for the exact diagonal required for current thread
    const unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure only threads within bounds update the diagonal
    if (i < width) {
        tgtMat[width * i + i] = mat[width * i + i] + val;
    }
}
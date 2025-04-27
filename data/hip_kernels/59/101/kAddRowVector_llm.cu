#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kAddRowVector(float* mat, float* vec, float* tgtMat, unsigned int width, unsigned int height) {
    // Compute linear index for the matrix
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Terminate threads that fall outside the matrix bounds
    if (idx >= width * height) return;
    // Compute row index and use it to add to the matrix element
    const unsigned int row = idx / width;
    tgtMat[idx] = mat[idx] + vec[row];
}
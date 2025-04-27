#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kAddDiagonal(float* mat, float* vec, float* tgtMat, unsigned int width) {
    // Calculate global index based on block and thread index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure the index is within the range of the matrix width
    if (idx < width) {
        // Perform addition for the diagonal element specific to the index
        tgtMat[width * idx + idx] = mat[width * idx + idx] + vec[idx];
    }
}
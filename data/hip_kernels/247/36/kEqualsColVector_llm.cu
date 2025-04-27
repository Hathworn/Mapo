#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kEqualsColVector(float* mat, float* vec, float* tgtMat, const int width, const int height) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;
    const unsigned int row = idx / width; // Calculate row index for vec
    const unsigned int col = idx % width; // Calculate column index

    // Use stride loop to handle threads across large matrices
    for (unsigned int i = idx; i < width * height; i += stride) {
        tgtMat[i] = mat[i] == vec[row];
    }
}
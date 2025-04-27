#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kMultByRowVector(float* mat, float* vec, float* tgtMat, unsigned int width, unsigned int height) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int colIdx = idx % width;
    const unsigned int rowIdx = idx / width;

    // Optimize by eliminating redundant division and modulus calculations
    if (rowIdx < height) {
        tgtMat[idx] = mat[idx] * vec[colIdx];
    }
}
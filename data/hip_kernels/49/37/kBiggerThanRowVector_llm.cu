#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kBiggerThanRowVector(float* mat, float* vec, float* tgtMat, const int width, const int height) {
    // Calculate the row and column based on thread and block indices
    const unsigned int col = blockIdx.x * blockDim.x + threadIdx.x;

    if (col < width) {
        for (unsigned int row = 0; row < height; ++row) {
            unsigned int i = row * width + col;
            tgtMat[i] = mat[i] > vec[col];
        }
    }
}
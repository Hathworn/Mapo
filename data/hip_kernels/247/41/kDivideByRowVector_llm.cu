#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kDivideByRowVector(float* mat, float* vec, float* tgtMat, unsigned int width, unsigned int height) {
    // Compute row and column indices for better cache usage
    unsigned int col = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int stride = blockDim.x * gridDim.x;

    for (unsigned int row = blockIdx.y * blockDim.y + threadIdx.y; row < height; row += blockDim.y * gridDim.y) {
        for (unsigned int i = col; i < width; i += stride) {
            tgtMat[row * width + i] = __fdividef(mat[row * width + i], vec[i]);
        }
    }
}
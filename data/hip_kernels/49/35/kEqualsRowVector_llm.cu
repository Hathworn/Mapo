#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kEqualsRowVector(float* mat, float* vec, float* tgtMat, const int width, const int height) {
    const unsigned int x = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Calculate global index
    if (x < width && y < height) {
        unsigned int idx = y * width + x;
        tgtMat[idx] = mat[idx] == vec[x];
    }
}
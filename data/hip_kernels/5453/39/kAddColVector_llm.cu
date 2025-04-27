#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kAddColVector(float* mat, float* vec, float* tgtMat, unsigned int width, unsigned int height) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x; // Improved naming for stride

    for (unsigned int i = idx; i < width * height; i += stride) {
        tgtMat[i] = mat[i] + vec[i % height];
    }
}
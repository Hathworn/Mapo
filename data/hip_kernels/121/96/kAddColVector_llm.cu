#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kAddColVector(float* mat, float* vec, float* tgtMat, unsigned int width, unsigned int height) {
    // Calculate unique thread index
    const unsigned int tid = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    // Loop through the matrix elements each thread should process
    for (unsigned int i = tid; i < width * height; i += stride) {
        // Perform vector addition
        tgtMat[i] = mat[i] + vec[i % height];
    }
}
```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kAddColMult(float* mat, float* vec, float* tgtMat, float mult, unsigned int width, unsigned int height) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int numThreads = blockDim.x * gridDim.x;
    const unsigned int stride = numThreads;

    // Use a while loop for fewer instructions and better performance
    unsigned int i = idx;
    while (i < width * height) {
        tgtMat[i] = mat[i] + mult * vec[i % height];
        i += stride;
    }
}
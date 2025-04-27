```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kAddColMult(float* mat, float* vec, float* tgtMat, float mult, unsigned int width, unsigned int height) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;
    unsigned int i = idx;

    // Loop unrolling for better performance
    while (i + stride < width * height) {
        tgtMat[i] = mat[i] + mult * vec[i % height];
        tgtMat[i + stride] = mat[i + stride] + mult * vec[(i + stride) % height];
        i += 2 * stride;
    }

    if (i < width * height) {
        tgtMat[i] = mat[i] + mult * vec[i % height];
    }
}
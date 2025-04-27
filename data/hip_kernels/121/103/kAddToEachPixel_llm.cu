#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kAddToEachPixel(float* mat1, float* mat2, float* tgtMat, float mult, unsigned int width, unsigned int height, unsigned int num_pix) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int numThreads = blockDim.x * gridDim.x;

    // Cache the height to reduce redundant calculations within the loop
    const unsigned int heightMult = height * num_pix;

    for (unsigned int i = idx; i < width * height; i += numThreads) {
        // Optimize index calculation by avoiding repeated modulo and division operations
        unsigned int row = i / heightMult;
        unsigned int col = i % height;
        tgtMat[i] = mat1[i] + mult * mat2[col + height * row];
    }
}
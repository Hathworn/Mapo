#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kAddToEachPixel(float* mat1, float* mat2, float* tgtMat, float mult, unsigned int width, unsigned int height, unsigned int num_pix) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int numThreads = blockDim.x * gridDim.x;
    const unsigned int total_size = width * height;

    // Use a standard for loop with a stride to improve warp efficiency
    for (unsigned int i = idx; i < total_size; i += numThreads) {
        unsigned int row = i / width;
        unsigned int col = i % width;
        unsigned int offset = col + width * (row / num_pix); // Calculate exact offset
        tgtMat[i] = mat1[i] + mult * mat2[offset];
    }
}
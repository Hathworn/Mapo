#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kAddToEachPixel(float* mat1, float* mat2, float* tgtMat, float mult, unsigned int width, unsigned int height, unsigned int num_pix) {
    // Calculate global index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Improved memory access pattern by reducing repeated calculations 
    unsigned int totalSize = width * height;
    unsigned int numThreads = blockDim.x * gridDim.x;
    unsigned int heightNumPix = height * num_pix;

    for (unsigned int i = idx; i < totalSize; i += numThreads) {
        unsigned int y = i % height;  // Column access optimization
        unsigned int x = i / heightNumPix;
        tgtMat[i] = mat1[i] + mult * mat2[y + height * x];
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kDivideByColVector(float* mat, float* vec, float* tgtMat, unsigned int width, unsigned int height) {
    // Calculate global thread index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Calculate number of threads working in parallel
    const unsigned int numThreads = blockDim.x * gridDim.x;
    // Loop through data in strides of numThreads
    for (unsigned int i = idx; i < width * height; i += numThreads) {
        // Perform element-wise division, take vec's corresponding column value using i / width
        tgtMat[i] = mat[i] / vec[i / width];
    }
}
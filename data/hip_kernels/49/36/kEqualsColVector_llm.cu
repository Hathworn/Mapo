#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel using shared memory for vector accessing
__global__ void kEqualsColVector(float* mat, float* vec, float* tgtMat, const int width, const int height) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int numThreads = blockDim.x * gridDim.x;
    __shared__ float sharedVec[1024]; // assuming max threads per block is 1024

    if (threadIdx.x < height) { // each thread loads one element of vec into shared memory
        sharedVec[threadIdx.x] = vec[threadIdx.x];
    }
    __syncthreads();

    for (unsigned int i = idx; i < width * height; i += numThreads) {
        const unsigned int row = i / width;
        tgtMat[i] = mat[i] == sharedVec[row];
    }
}
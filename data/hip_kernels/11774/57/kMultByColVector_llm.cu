#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kMultByColVector(float* mat, float* vec, float* tgtMat, unsigned int width, unsigned int height) {
    // Utilize shared memory to reduce global memory access for vec
    extern __shared__ float sharedVec[];
    const unsigned int tx = threadIdx.x;

    // Load vector data into shared memory
    if (tx < height) {
        sharedVec[tx] = vec[tx];
    }
    __syncthreads();

    const unsigned int idx = blockIdx.x * blockDim.x + tx;
    const unsigned int numThreads = blockDim.x * gridDim.x;

    for (unsigned int i = idx; i < width * height; i += numThreads) {
        tgtMat[i] = mat[i] * sharedVec[i % height];
    }
}
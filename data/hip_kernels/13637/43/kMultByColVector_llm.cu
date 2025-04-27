#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kMultByColVector(float* mat, float* vec, float* tgtMat, unsigned int width, unsigned int height) {
    // Optimize by calculating thread index only once and using shared memory for the vector
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    __shared__ float sharedVec[1024]; // Assuming a block size that does not exceed 1024

    for (unsigned int i = idx; i < width * height; i += stride) {
        if (threadIdx.x < height) {
            sharedVec[threadIdx.x] = vec[threadIdx.x];
        }
        __syncthreads();
        tgtMat[i] = mat[i] * sharedVec[i % height];
        __syncthreads();
    }
}
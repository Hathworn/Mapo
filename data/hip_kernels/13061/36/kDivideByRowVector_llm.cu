#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kDivideByRowVector(float* mat, float* vec, float* tgtMat, unsigned int width, unsigned int height) {
    // Use shared memory for vector to reduce global memory access
    extern __shared__ float sharedVec[];
    const unsigned int tx = threadIdx.x;
    const unsigned int bx = blockIdx.x;
    const unsigned int bd = blockDim.x;

    if (tx < width) {
        sharedVec[tx] = vec[tx];
    }

    __syncthreads();

    const unsigned int idx = bx * bd + tx;
    const unsigned int numThreads = bd * gridDim.x;

    for (unsigned int i = idx; i < width * height; i += numThreads) {
        tgtMat[i] = __fdividef(mat[i], sharedVec[i % width]);
    }
}
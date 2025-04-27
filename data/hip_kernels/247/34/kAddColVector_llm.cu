#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kAddColVector(float* mat, float* vec, float* tgtMat, const unsigned int width, const unsigned int height, const float scaleVec) {
    // Use shared memory for vec[] to optimize memory access
    extern __shared__ float sharedVec[];

    // Each block loads a portion of the vector to shared memory
    unsigned int colIdx = threadIdx.x;
    if (colIdx < width) {
        sharedVec[colIdx] = vec[colIdx];
    }
    __syncthreads(); // Ensure all threads have completed the memory load

    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int numThreads = blockDim.x * gridDim.x;

    for (unsigned int i = idx; i < width * height; i += numThreads) {
        // Use shared memory and avoid global memory access for vec
        tgtMat[i] = mat[i] + scaleVec * sharedVec[i % width];
    }
}
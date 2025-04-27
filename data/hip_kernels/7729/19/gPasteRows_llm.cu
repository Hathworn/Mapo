#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gPasteRows(float* out, const float* in, size_t cols, const size_t* targetRowIdx, size_t rows) {
    // Use shared memory to reduce global memory accesses
    extern __shared__ float sharedMem[];

    int j = blockIdx.x + blockIdx.y * gridDim.x;
    if (j < rows) {
        size_t dstId = targetRowIdx[j];
        size_t srcId = j;

        float* rowOut = out + dstId * cols;
        const float* rowIn = in + srcId * cols;

        // Load a block of data into shared memory
        for (int i = threadIdx.x; i < cols; i += blockDim.x) {
            sharedMem[i] = rowIn[i];
        }
        __syncthreads();

        // Perform atomic addition using shared memory data
        for (int i = threadIdx.x; i < cols; i += blockDim.x) {
            atomicAdd(rowOut + i, sharedMem[i]);
        }
    }
}
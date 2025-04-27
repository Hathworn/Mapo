#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kDotProduct_r(float* a, float* b, float* target, const uint numElements) {
    __shared__ float shmem[DP_BLOCKSIZE];

    // Initialize shared memory with zeros.
    uint eidx = DP_BLOCKSIZE * blockIdx.x + threadIdx.x;
    shmem[threadIdx.x] = 0.0f;

    // Use loop unrolling for each thread.
    if (eidx < gridDim.x * DP_BLOCKSIZE) {
        uint gridSize = gridDim.x * DP_BLOCKSIZE;
        for (; eidx < numElements; eidx += gridSize) {
            shmem[threadIdx.x] += a[eidx] * b[eidx];
        }
    }
    __syncthreads();

    // Optimized reduction using unrolling and avoiding bank conflicts.
    for (int offset = blockDim.x / 2; offset > 32; offset >>= 1) {
        if (threadIdx.x < offset) {
            shmem[threadIdx.x] += shmem[threadIdx.x + offset];
        }
        __syncthreads();
    }

    // Handling the last warp separately.
    if (threadIdx.x < 32) {
        volatile float* mysh = shmem;
        mysh[threadIdx.x] += mysh[threadIdx.x + 32];
        mysh[threadIdx.x] += mysh[threadIdx.x + 16];
        mysh[threadIdx.x] += mysh[threadIdx.x + 8];
        mysh[threadIdx.x] += mysh[threadIdx.x + 4];
        mysh[threadIdx.x] += mysh[threadIdx.x + 2];
        mysh[threadIdx.x] += mysh[threadIdx.x + 1];

        // Write the result from the first thread of the block to the target.
        if (threadIdx.x == 0) {
            target[blockIdx.x] = mysh[0];
        }
    }
}
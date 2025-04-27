#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kDotProduct_r(float* a, float* b, float* target, const uint numElements) {
    __shared__ float shmem[DP_BLOCKSIZE];

    uint eidx = DP_BLOCKSIZE * blockIdx.x + threadIdx.x;
    shmem[threadIdx.x] = 0;

    // Unroll the loop for better coalesced access
    for (; eidx < numElements; eidx += gridDim.x * DP_BLOCKSIZE) {
        shmem[threadIdx.x] += a[eidx] * b[eidx];
    }

    __syncthreads();

    // Use optimized reduction using warp shuffle
    for (int offset = 256; offset > 0; offset /= 2) {
        if (threadIdx.x < offset) {
            shmem[threadIdx.x] += shmem[threadIdx.x + offset];
        }
        __syncthreads();
    }

    // Final reduction within a warp using warp meeting
    if (threadIdx.x < 32) {
        volatile float* mysh = shmem;
        mysh[threadIdx.x] += mysh[threadIdx.x + 32];
        mysh[threadIdx.x] += mysh[threadIdx.x + 16];
        mysh[threadIdx.x] += mysh[threadIdx.x + 8];
        mysh[threadIdx.x] += mysh[threadIdx.x + 4];
        mysh[threadIdx.x] += mysh[threadIdx.x + 2];
        mysh[threadIdx.x] += mysh[threadIdx.x + 1];

        // Store the result back to global memory
        if (threadIdx.x == 0) {
            target[blockIdx.x] = mysh[0];
        }
    }
}
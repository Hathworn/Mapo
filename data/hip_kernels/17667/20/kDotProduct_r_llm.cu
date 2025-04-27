#include "hip/hip_runtime.h"
#include "includes.h"

#define DP_BLOCKSIZE 512  // Ensure DP_BLOCKSIZE is defined appropriately

__global__ void kDotProduct_r(float* a, float* b, float* target, const uint numCols, const uint numElements) {
    __shared__ float shmem[DP_BLOCKSIZE];

    uint eidx = DP_BLOCKSIZE * blockIdx.x + threadIdx.x;
    float tempSum = 0.0f;  // Use register for intermediate sum

    while (eidx < numElements) {  // Loop to cover all elements within block
        tempSum += a[eidx] * b[eidx];
        eidx += numCols;
    }
    shmem[threadIdx.x] = tempSum;
    __syncthreads();

    // Optimize reduction using sequential addressing
    for (uint stride = DP_BLOCKSIZE / 2; stride > 32; stride >>= 1) {
        if (threadIdx.x < stride) {
            shmem[threadIdx.x] += shmem[threadIdx.x + stride];
        }
        __syncthreads();
    }

    // Unroll last warp
    if (threadIdx.x < 32) {
        volatile float* mysh = shmem;
        mysh[threadIdx.x] += mysh[threadIdx.x + 32];
        mysh[threadIdx.x] += mysh[threadIdx.x + 16];
        mysh[threadIdx.x] += mysh[threadIdx.x + 8];
        mysh[threadIdx.x] += mysh[threadIdx.x + 4];
        mysh[threadIdx.x] += mysh[threadIdx.x + 2];
        mysh[threadIdx.x] += mysh[threadIdx.x + 1];
    }

    if (threadIdx.x == 0) {
        target[blockIdx.x] = shmem[0];
    }
}
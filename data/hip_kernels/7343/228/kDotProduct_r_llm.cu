#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kDotProduct_r(float* a, float* b, float* target, const uint numElements) {
    __shared__ float shmem[DP_BLOCKSIZE];

    uint eidx = DP_BLOCKSIZE * blockIdx.x + threadIdx.x;
    float sum = 0;  // Use a local variable to accumulate results

    while (eidx < numElements) {  // Adjust loop to process all elements
        sum += a[eidx] * b[eidx];
        eidx += gridDim.x * DP_BLOCKSIZE;
    }
    shmem[threadIdx.x] = sum;  // Store local result in shared memory

    __syncthreads();

    // Use a warp-level reduction for improved efficiency
    if (threadIdx.x < 32) {
        volatile float* mysh = shmem;

        if (DP_BLOCKSIZE >= 64) mysh[threadIdx.x] += mysh[threadIdx.x + 32];
        if (DP_BLOCKSIZE >= 32) mysh[threadIdx.x] += mysh[threadIdx.x + 16];
        if (DP_BLOCKSIZE >= 16) mysh[threadIdx.x] += mysh[threadIdx.x + 8];
        if (DP_BLOCKSIZE >= 8) mysh[threadIdx.x] += mysh[threadIdx.x + 4];
        if (DP_BLOCKSIZE >= 4) mysh[threadIdx.x] += mysh[threadIdx.x + 2];
        if (DP_BLOCKSIZE >= 2) mysh[threadIdx.x] += mysh[threadIdx.x + 1];
    }

    // Write the result of each block to target array
    if (threadIdx.x == 0) {
        target[blockIdx.x] = shmem[0];
    }
}
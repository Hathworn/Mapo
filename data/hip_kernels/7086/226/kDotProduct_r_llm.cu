#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kDotProduct_r(float* a, float* b, float* target, const uint numElements) {
    __shared__ float shmem[DP_BLOCKSIZE];

    uint eidx = DP_BLOCKSIZE * blockIdx.x + threadIdx.x;
    float sum = 0.0f; // Use a register for accumulation

    // Optimized loop to accumulate partial results in a register
    while (eidx < numElements) {
        sum += a[eidx] * b[eidx];
        eidx += gridDim.x * DP_BLOCKSIZE;
    }
    
    // Store the partial result in shared memory
    shmem[threadIdx.x] = sum;
    __syncthreads();

    // Optimize reduction using warp shuffling
    if (threadIdx.x < 32) {
        volatile float* mysh = shmem;
        if (threadIdx.x < 16) mysh[threadIdx.x] += mysh[threadIdx.x + 16];
        if (threadIdx.x < 8) mysh[threadIdx.x] += mysh[threadIdx.x + 8];
        if (threadIdx.x < 4) mysh[threadIdx.x] += mysh[threadIdx.x + 4];
        if (threadIdx.x < 2) mysh[threadIdx.x] += mysh[threadIdx.x + 2];
        if (threadIdx.x < 1) mysh[threadIdx.x] += mysh[threadIdx.x + 1];

        // First thread writes the result to the target
        if (threadIdx.x == 0) {
            target[blockIdx.x] = mysh[0];
        }
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"
#define DP_BLOCKSIZE 512

__global__ void kDotProduct_r(float* a, float* b, float* target, const uint numElements) {
    __shared__ float shmem[DP_BLOCKSIZE];

    uint eidx = DP_BLOCKSIZE * blockIdx.x + threadIdx.x;
    // Initialize shared memory with 0
    shmem[threadIdx.x] = 0;
    // Ensure bounds checking for iteration over elements
    if (eidx < numElements) {
        for (; eidx < numElements; eidx += gridDim.x * DP_BLOCKSIZE) {
            shmem[threadIdx.x] += a[eidx] * b[eidx];
        }
    }
    __syncthreads();

    // Perform parallel reduction in shared memory
    for (int stride = DP_BLOCKSIZE / 2; stride > 32; stride >>= 1) {
        if (threadIdx.x < stride) {
            shmem[threadIdx.x] += shmem[threadIdx.x + stride];
        }
        __syncthreads();
    }
    
    // Handle final warp-level reduction manually with volatile
    if (threadIdx.x < 32) {
        volatile float* mysh = &shmem[threadIdx.x];
        *mysh += mysh[32];
        *mysh += mysh[16];
        *mysh += mysh[8];
        *mysh += mysh[4];
        *mysh += mysh[2];
        *mysh += mysh[1];
        // Store result from the first thread in the block to target
        if (threadIdx.x == 0) {
            target[blockIdx.x] = *mysh;
        }
    }
}
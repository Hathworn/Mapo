#include "hip/hip_runtime.h"
#include "includes.h"

#define DP_BLOCKSIZE 512  // Define block size for dot product

__global__ void kDotProduct_r(float* a, float* b, float* target, const uint numElements) {
    __shared__ float shmem[DP_BLOCKSIZE];

    uint eidx = DP_BLOCKSIZE * blockIdx.x + threadIdx.x;
    float sum = 0;  // Initialize sum for each thread

    // Unrolled iteration to increase performance
    for (; eidx < numElements; eidx += gridDim.x * DP_BLOCKSIZE) {
        sum += a[eidx] * b[eidx];
    }

    shmem[threadIdx.x] = sum;
    __syncthreads();

    // Optimize reduction using loop unrolling for better performance
    if (threadIdx.x < 256) shmem[threadIdx.x] += shmem[threadIdx.x + 256];
    __syncthreads();

    if (threadIdx.x < 128) shmem[threadIdx.x] += shmem[threadIdx.x + 128];
    __syncthreads();

    if (threadIdx.x < 64) shmem[threadIdx.x] += shmem[threadIdx.x + 64];
    __syncthreads();

    // Use a single warp for final reduction steps
    if (threadIdx.x < 32) {
        volatile float* mysh = shmem;  // Use volatile to prevent reordering
        *mysh += mysh[threadIdx.x + 32];
        *mysh += mysh[threadIdx.x + 16];
        *mysh += mysh[threadIdx.x + 8];
        *mysh += mysh[threadIdx.x + 4];
        *mysh += mysh[threadIdx.x + 2];
        *mysh += mysh[threadIdx.x + 1];
    }

    // Save result from thread 0
    if (threadIdx.x == 0) {
        target[blockIdx.x] = shmem[0];
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kDotProduct_r(float* a, float* b, float* target, const uint numElements) {
    __shared__ float shmem[DP_BLOCKSIZE];

    unsigned int tid = threadIdx.x;
    unsigned int globalIndex = DP_BLOCKSIZE * blockIdx.x + threadIdx.x;
    float sum = 0.0f;

    // Loop through elements and accumulate the product
    while (globalIndex < numElements) {
        sum += a[globalIndex] * b[globalIndex];
        globalIndex += gridDim.x * DP_BLOCKSIZE;
    }

    shmem[tid] = sum;
    __syncthreads();

    // Perform reduction in shared memory
    if (DP_BLOCKSIZE >= 512 && tid < 256) shmem[tid] += shmem[tid + 256];
    __syncthreads();
    if (DP_BLOCKSIZE >= 256 && tid < 128) shmem[tid] += shmem[tid + 128];
    __syncthreads();
    if (DP_BLOCKSIZE >= 128 && tid < 64) shmem[tid] += shmem[tid + 64];
    __syncthreads();

    // Reduce last warp using volatile memory operations for performance
    if (tid < 32) {
        volatile float* vsmem = shmem;
        vsmem[tid] += vsmem[tid + 32];
        vsmem[tid] += vsmem[tid + 16];
        vsmem[tid] += vsmem[tid + 8];
        vsmem[tid] += vsmem[tid + 4];
        vsmem[tid] += vsmem[tid + 2];
        vsmem[tid] += vsmem[tid + 1];
    }

    // Write the result for this block to the target array
    if (tid == 0) {
        target[blockIdx.x] = shmem[0];
    }
}
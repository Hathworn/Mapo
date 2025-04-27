#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kDotProduct_r(float* a, float* b, float* target, const uint numElements) {
    __shared__ float shmem[DP_BLOCKSIZE];

    uint eidx = DP_BLOCKSIZE * blockIdx.x + threadIdx.x;
    float temp_sum = 0.0f; // Use register for accumulation

    // Unroll inner loop
    if (eidx < numElements) {
        const uint stepSize = gridDim.x * DP_BLOCKSIZE;
        for (; eidx < numElements; eidx += stepSize) {
            temp_sum += a[eidx] * b[eidx];
        }
    }
    shmem[threadIdx.x] = temp_sum; // Store sum in shared memory
    __syncthreads();

    // Unroll reduction loop
    if (threadIdx.x < 128) shmem[threadIdx.x] += shmem[threadIdx.x + 128];
    __syncthreads();
    if (threadIdx.x < 64) shmem[threadIdx.x] += shmem[threadIdx.x + 64];
    __syncthreads();
    if (threadIdx.x < 32) {
        volatile float* mysh = shmem; // Eliminate bank conflicts
        mysh[threadIdx.x] += mysh[threadIdx.x + 32];
        mysh[threadIdx.x] += mysh[threadIdx.x + 16];
        mysh[threadIdx.x] += mysh[threadIdx.x + 8];
        mysh[threadIdx.x] += mysh[threadIdx.x + 4];
        mysh[threadIdx.x] += mysh[threadIdx.x + 2];
        mysh[threadIdx.x] += mysh[threadIdx.x + 1];
    }

    // Write result
    if (threadIdx.x == 0) {
        target[blockIdx.x] = shmem[0];
    }
}
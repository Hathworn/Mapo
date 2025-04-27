#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kDotProduct_r(float* a, float* b, float* target, const uint numElements) {
    __shared__ float shmem[DP_BLOCKSIZE];

    // Compute element index
    uint eidx = DP_BLOCKSIZE * blockIdx.x + threadIdx.x;
    float sum = 0.0f;

    // Loop through all elements sequentially to compute partial dot products
    if (eidx < numElements) {
        for (; eidx < numElements; eidx += gridDim.x * DP_BLOCKSIZE) {
            sum += a[eidx] * b[eidx];
        }
    }

    // Store computed sum in shared memory
    shmem[threadIdx.x] = sum;
    __syncthreads();

    // Perform reduction in shared memory using threads from the block
    if (threadIdx.x < 128) shmem[threadIdx.x] += shmem[threadIdx.x + 128];
    __syncthreads();
    if (threadIdx.x < 64) shmem[threadIdx.x] += shmem[threadIdx.x + 64];
    __syncthreads();

    // Unroll last warp and use volatile to prevent optimization issues
    if (threadIdx.x < 32) {
        volatile float* mysh = shmem;
        mysh[threadIdx.x] += mysh[threadIdx.x + 32];
        mysh[threadIdx.x] += mysh[threadIdx.x + 16];
        mysh[threadIdx.x] += mysh[threadIdx.x + 8];
        mysh[threadIdx.x] += mysh[threadIdx.x + 4];
        mysh[threadIdx.x] += mysh[threadIdx.x + 2];
        mysh[threadIdx.x] += mysh[threadIdx.x + 1];
    }

    // Store result in target array
    if (threadIdx.x == 0) {
        target[blockIdx.x] = shmem[0];
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kDotProduct_r(float* a, float* b, float* target, const uint numElements) {
    __shared__ float shmem[DP_BLOCKSIZE];

    uint eidx = DP_BLOCKSIZE * blockIdx.x + threadIdx.x;
    float sum = 0.0f;  // Reduce shared memory access by using a local variable

    if (eidx < numElements) {
        for (; eidx < numElements; eidx += gridDim.x * DP_BLOCKSIZE) {
            sum += a[eidx] * b[eidx];
        }
    }
    shmem[threadIdx.x] = sum;
    __syncthreads();

    // Reduce within shared memory
    if (threadIdx.x < 128) shmem[threadIdx.x] += shmem[threadIdx.x + 128];
    __syncthreads();
    if (threadIdx.x < 64) shmem[threadIdx.x] += shmem[threadIdx.x + 64];
    __syncthreads();

    // Use warp-level primitives to reduce further
    if (threadIdx.x < 32) {
        volatile float* myshmem = shmem;
        myshmem[threadIdx.x] += myshmem[threadIdx.x + 32];
        myshmem[threadIdx.x] += myshmem[threadIdx.x + 16];
        myshmem[threadIdx.x] += myshmem[threadIdx.x + 8];
        myshmem[threadIdx.x] += myshmem[threadIdx.x + 4];
        myshmem[threadIdx.x] += myshmem[threadIdx.x + 2];
        myshmem[threadIdx.x] += myshmem[threadIdx.x + 1];
    }

    // Write the block's result to global memory
    if (threadIdx.x == 0) {
        target[blockIdx.x] = shmem[0];
    }
}
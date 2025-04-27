#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kDotProduct_r(float* a, float* b, float* target, const uint numElements) {
    __shared__ float shmem[DP_BLOCKSIZE];

    uint eidx = DP_BLOCKSIZE * blockIdx.x + threadIdx.x;
    float sum = 0.0f;

    // Loop unrolling to improve memory access coalescing
    if (eidx < gridDim.x * DP_BLOCKSIZE) {
        for (; eidx + 3 < numElements; eidx += gridDim.x * DP_BLOCKSIZE * 4) {
            sum += a[eidx] * b[eidx];
            sum += a[eidx + 1] * b[eidx + 1];
            sum += a[eidx + 2] * b[eidx + 2];
            sum += a[eidx + 3] * b[eidx + 3];
        }
        for (; eidx < numElements; eidx += gridDim.x * DP_BLOCKSIZE) {
            sum += a[eidx] * b[eidx];
        }
    }
    shmem[threadIdx.x] = sum;
    __syncthreads();

    // Use warp reduction to minimize synchronization
    if (threadIdx.x < 128) { shmem[threadIdx.x] += shmem[threadIdx.x + 128]; }
    __syncthreads();
    if (threadIdx.x < 64) { shmem[threadIdx.x] += shmem[threadIdx.x + 64]; }
    __syncthreads();

    if (threadIdx.x < 32) {
        volatile float* mysh = &shmem[threadIdx.x];
        *mysh += mysh[32];
        *mysh += mysh[16];
        *mysh += mysh[8];
        *mysh += mysh[4];
        *mysh += mysh[2];
        *mysh += mysh[1];
    }

    if (threadIdx.x == 0) {
        target[blockIdx.x] = shmem[0];
    }
}
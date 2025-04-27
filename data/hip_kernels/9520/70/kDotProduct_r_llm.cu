#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kDotProduct_r(float* a, float* b, float* target, const uint numElements) {
    __shared__ float shmem[DP_BLOCKSIZE];

    uint eidx = DP_BLOCKSIZE * blockIdx.x + threadIdx.x;
    shmem[threadIdx.x] = 0;

    // Loop over elements; take advantage of greater warp efficiency
    while (eidx < numElements) {
        shmem[threadIdx.x] += a[eidx] * b[eidx];
        eidx += gridDim.x * DP_BLOCKSIZE;
    }

    __syncthreads();

    // Unroll reduction within block
    if (threadIdx.x < 256) shmem[threadIdx.x] += shmem[threadIdx.x + 256];
    __syncthreads();
    if (threadIdx.x < 128) shmem[threadIdx.x] += shmem[threadIdx.x + 128];
    __syncthreads();
    if (threadIdx.x < 64) shmem[threadIdx.x] += shmem[threadIdx.x + 64];
    __syncthreads();

    // Use warp shuffle for final reduction
    if (threadIdx.x < 32) {
        volatile float* mysh = shmem;
        float sum = mysh[threadIdx.x];
        sum += __shfl_down_sync(0xffffffff, sum, 16);
        sum += __shfl_down_sync(0xffffffff, sum, 8);
        sum += __shfl_down_sync(0xffffffff, sum, 4);
        sum += __shfl_down_sync(0xffffffff, sum, 2);
        sum += __shfl_down_sync(0xffffffff, sum, 1);
        if (threadIdx.x == 0) target[blockIdx.x] = sum;
    }
}
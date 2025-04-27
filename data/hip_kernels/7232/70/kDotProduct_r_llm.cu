#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kDotProduct_r(float* a, float* b, float* target, const uint numElements) {
    __shared__ float shmem[DP_BLOCKSIZE];

    uint eidx = DP_BLOCKSIZE * blockIdx.x + threadIdx.x;
    shmem[threadIdx.x] = 0;

    // Unroll the loop for better performance
    if (eidx < numElements) {
        for (uint i = eidx; i < numElements; i += gridDim.x * DP_BLOCKSIZE) {
            shmem[threadIdx.x] += a[i] * b[i];
        }
    }
    __syncthreads();

    // Unroll reduction steps
    if (threadIdx.x < 256) shmem[threadIdx.x] += shmem[threadIdx.x + 256];
    __syncthreads();
    if (threadIdx.x < 128) shmem[threadIdx.x] += shmem[threadIdx.x + 128];
    __syncthreads();
    if (threadIdx.x < 64) shmem[threadIdx.x] += shmem[threadIdx.x + 64];
    __syncthreads();

    // Use warp-level shuffle for efficiency
    if (threadIdx.x < 32) {
        float val = shmem[threadIdx.x];
        val += __shfl_down(val, 16);
        val += __shfl_down(val, 8);
        val += __shfl_down(val, 4);
        val += __shfl_down(val, 2);
        val += __shfl_down(val, 1);

        if (threadIdx.x == 0) {
            target[blockIdx.x] = val;
        }
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kDotProduct_r(float* a, float* b, float* target, const uint numElements) {
    __shared__ float shmem[DP_BLOCKSIZE];

    uint eidx = DP_BLOCKSIZE * blockIdx.x + threadIdx.x;
    float sum = 0; // Use a register to accumulate results

    for (; eidx < numElements; eidx += gridDim.x * DP_BLOCKSIZE) {
        sum += a[eidx] * b[eidx];
    }
    shmem[threadIdx.x] = sum; // Save register sum to shared memory
    __syncthreads();

    // Optimize reduction using unrolling
    if (threadIdx.x < 128) shmem[threadIdx.x] += shmem[threadIdx.x + 128];
    __syncthreads();

    if (threadIdx.x < 64) shmem[threadIdx.x] += shmem[threadIdx.x + 64];
    __syncthreads();

    if (threadIdx.x < 32) {
        // Use warp shuffle for final reduction
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
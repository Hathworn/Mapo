#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kDotProduct_r(float* a, float* b, float* target, const uint numElements) {
    __shared__ float shmem[DP_BLOCKSIZE];

    uint eidx = DP_BLOCKSIZE * blockIdx.x + threadIdx.x;
    float local_sum = 0; // Store local sum

    // Unroll loop to improve performance
    if (eidx < gridDim.x * DP_BLOCKSIZE) {
        for (; eidx < numElements; eidx += gridDim.x * DP_BLOCKSIZE) {
            local_sum += a[eidx] * b[eidx];
        }
    }
    shmem[threadIdx.x] = local_sum;
    __syncthreads();

    // Use shared memory reduction for efficiency
    if (threadIdx.x < 256) {
        shmem[threadIdx.x] += shmem[threadIdx.x + 256];
    }
    __syncthreads();
    if (threadIdx.x < 128) {
        shmem[threadIdx.x] += shmem[threadIdx.x + 128];
    }
    __syncthreads();
    if (threadIdx.x < 64) {
        shmem[threadIdx.x] += shmem[threadIdx.x + 64];
    }
    __syncthreads();

    // Warp-level reduction
    if (threadIdx.x < 32) {
        volatile float* mysh = shmem;
        mysh[threadIdx.x] += mysh[threadIdx.x + 32];
        mysh[threadIdx.x] += mysh[threadIdx.x + 16];
        mysh[threadIdx.x] += mysh[threadIdx.x + 8];
        mysh[threadIdx.x] += mysh[threadIdx.x + 4];
        mysh[threadIdx.x] += mysh[threadIdx.x + 2];
        mysh[threadIdx.x] += mysh[threadIdx.x + 1];
    }

    // Write result to target
    if (threadIdx.x == 0) {
        target[blockIdx.x] = shmem[0];
    }
}
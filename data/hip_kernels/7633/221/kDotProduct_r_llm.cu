#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kDotProduct_r(float* a, float* b, float* target, const uint numElements) {
    __shared__ float shmem[DP_BLOCKSIZE];

    uint eidx = DP_BLOCKSIZE * blockIdx.x + threadIdx.x;
    float sum = 0.0f;

    // Efficient handling of boundary condition
    for (; eidx < numElements; eidx += gridDim.x * DP_BLOCKSIZE) {
        sum += a[eidx] * b[eidx];
    }
    shmem[threadIdx.x] = sum;
    __syncthreads();
    
    // Unroll loop to reduce execution divergence
    if (threadIdx.x < 128) { shmem[threadIdx.x] += shmem[threadIdx.x + 128]; }
    __syncthreads();
    if (threadIdx.x < 64) { shmem[threadIdx.x] += shmem[threadIdx.x + 64]; }
    __syncthreads();

    // Further optimization for warp-level execution
    if (threadIdx.x < 32) {
        volatile float* mysh = &shmem[threadIdx.x];
        *mysh += mysh[32];
        *mysh += mysh[16];
        *mysh += mysh[8];
        *mysh += mysh[4];
        *mysh += mysh[2];
        *mysh += mysh[1];
    }

    // Only write result by first thread in block
    if (threadIdx.x == 0) {
        target[blockIdx.x] = shmem[0];
    }
}
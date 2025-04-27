#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kDotProduct_r(float* a, float* b, float* target, const uint numElements) {
    __shared__ float shmem[DP_BLOCKSIZE];

    uint eidx = DP_BLOCKSIZE * blockIdx.x + threadIdx.x;
    float sum = 0.0f;
    
    // Efficient loop unrolling and read in batches
    for (; eidx < numElements; eidx += gridDim.x * DP_BLOCKSIZE) {
        sum += a[eidx] * b[eidx];
    }
    
    shmem[threadIdx.x] = sum;
    __syncthreads();

    // Optimized warp reduction
    for (uint s = DP_BLOCKSIZE / 2; s > 32; s >>= 1) {
        if (threadIdx.x < s) {
            shmem[threadIdx.x] += shmem[threadIdx.x + s];
        }
        __syncthreads();
    }

    // Warp-level reduction with volatile
    if (threadIdx.x < 32) {
        volatile float* mysh = shmem;
        if (threadIdx.x < 16) mysh[threadIdx.x] += mysh[threadIdx.x + 16];
        if (threadIdx.x < 8) mysh[threadIdx.x] += mysh[threadIdx.x + 8];
        if (threadIdx.x < 4) mysh[threadIdx.x] += mysh[threadIdx.x + 4];
        if (threadIdx.x < 2) mysh[threadIdx.x] += mysh[threadIdx.x + 2];
        if (threadIdx.x < 1) mysh[threadIdx.x] += mysh[threadIdx.x + 1];
        if (threadIdx.x == 0) {
            target[blockIdx.x] = mysh[0];
        }
    }
}
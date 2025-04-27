#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kDotProduct_r(float* a, float* b, float* target, const uint numElements) {
    __shared__ float shmem[DP_BLOCKSIZE];

    uint eidx = DP_BLOCKSIZE * blockIdx.x + threadIdx.x;
    float temp = 0.0f; // Use register for accumulation

    if (eidx < numElements) { 
        // Loop unrolling for improved performance
        for (; eidx < numElements; eidx += gridDim.x * DP_BLOCKSIZE) { 
            temp += a[eidx] * b[eidx];
        }
    }
    shmem[threadIdx.x] = temp;
    __syncthreads();

    // Using warp-level reduction for faster execution
    for (uint stride = DP_BLOCKSIZE / 2; stride > 0; stride >>= 1) {
        if (threadIdx.x < stride) {
            shmem[threadIdx.x] += shmem[threadIdx.x + stride];
        }
        __syncthreads();
    }

    if (threadIdx.x == 0) {
        target[blockIdx.x] = shmem[0];
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kDotProduct_r(float* a, float* b, float* target,  const uint numElements) {
    __shared__ float shmem[DP_BLOCKSIZE];

    uint eidx = DP_BLOCKSIZE * blockIdx.x + threadIdx.x;
    float sum = 0.0f; // Use register for thread-local accumulation

    // Unrolling loop for efficiency
    if (eidx < numElements) {
        for (; eidx < numElements; eidx += gridDim.x * DP_BLOCKSIZE) {
            sum += a[eidx] * b[eidx];
        }
    }
    shmem[threadIdx.x] = sum;
    __syncthreads();

    // Optimize reduction by using a single warp for the final accumulation
    for (int offset = DP_BLOCKSIZE / 2; offset > 0; offset >>= 1) {
        if (threadIdx.x < offset) {
            shmem[threadIdx.x] += shmem[threadIdx.x + offset];
        }
        __syncthreads();
    }

    // Write the computed block result to global memory
    if (threadIdx.x == 0) {
        target[blockIdx.x] = shmem[0];
    }
}
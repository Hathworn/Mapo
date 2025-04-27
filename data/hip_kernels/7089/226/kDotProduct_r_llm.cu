```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kDotProduct_r(float* a, float* b, float* target, const uint numElements) {
    extern __shared__ float shmem[];

    uint eidx = DP_BLOCKSIZE * blockIdx.x + threadIdx.x;
    float temp = 0.0f; // Use register for reduction
    if (eidx < numElements) {
        for (; eidx < numElements; eidx += gridDim.x * DP_BLOCKSIZE) {
            temp += a[eidx] * b[eidx];
        }
    }
    shmem[threadIdx.x] = temp;
    __syncthreads(); // Ensure all loads are complete

    // Reduce within shared memory using a loop to improve readability and future maintenance
    for (uint stride = DP_BLOCKSIZE / 2; stride > 0; stride >>= 1) {
        if (threadIdx.x < stride) {
            shmem[threadIdx.x] += shmem[threadIdx.x + stride];
        }
        __syncthreads(); // Synchronize at each step of reduction
    }

    // Store the result for this block
    if (threadIdx.x == 0) {
        target[blockIdx.x] = shmem[0];
    }
}
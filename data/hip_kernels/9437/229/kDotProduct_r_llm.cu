#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kDotProduct_r(float* a, float* b, float* target, const uint numElements) {
    __shared__ float shmem[DP_BLOCKSIZE];

    uint eidx = DP_BLOCKSIZE * blockIdx.x + threadIdx.x;
    float sum = 0.0f; // Use a register for interim summation.

    // Loop unrolling for increased efficiency.
    while (eidx < numElements) {
        sum += a[eidx] * b[eidx];
        eidx += gridDim.x * DP_BLOCKSIZE;
    }
    shmem[threadIdx.x] = sum;
    __syncthreads();

    // Reduce shared memory using a loop for clarity.
    for (uint s = DP_BLOCKSIZE / 2; s > 0; s >>= 1) {
        if (threadIdx.x < s) {
            shmem[threadIdx.x] += shmem[threadIdx.x + s];
        }
        __syncthreads();
    }

    if (threadIdx.x == 0) {
        target[blockIdx.x] = shmem[0]; // Write result of the block to the target array.
    }
}
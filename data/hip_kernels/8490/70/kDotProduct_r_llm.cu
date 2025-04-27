#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kDotProduct_r(float* a, float* b, float* target, const uint numElements) {
    __shared__ float shmem[DP_BLOCKSIZE];

    uint eidx = DP_BLOCKSIZE * blockIdx.x + threadIdx.x;
    float sum = 0; // Use a register to accumulate partial sums

    if (eidx < gridDim.x * DP_BLOCKSIZE) {
        for (; eidx < numElements; eidx += gridDim.x * DP_BLOCKSIZE) {
            sum += a[eidx] * b[eidx]; // Accumulate in register
        }
    }
    shmem[threadIdx.x] = sum; // Store the result in shared memory
    __syncthreads();

    // Efficient parallel reduction in shared memory
    for (uint stride = DP_BLOCKSIZE / 2; stride > 0; stride >>= 1) {
        if (threadIdx.x < stride) {
            shmem[threadIdx.x] += shmem[threadIdx.x + stride];
        }
        __syncthreads();
    }

    // Write the result for this block to global memory
    if (threadIdx.x == 0) {
        target[blockIdx.x] = shmem[0];
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"

// Improved kernel function for dot product
__global__ void kDotProduct_r(float* a, float* b, float* target, const uint numCols, const uint numElements) {
    __shared__ float shmem[DP_BLOCKSIZE];

    uint eidx = DP_BLOCKSIZE * blockIdx.x + threadIdx.x;
    float sum = 0.0f; // Local accumulator

    // Loop to calculate partial dot product
    for (; eidx < numElements; eidx += numCols) {
        sum += a[eidx] * b[eidx];
    }
    shmem[threadIdx.x] = sum;
    __syncthreads();

    // Unrolling with single warp shuffle reduction
    if (threadIdx.x < 32) {
        for (int offset = 16; offset > 0; offset >>= 1) {
            sum += __shfl_down_sync(0xFFFFFFFF, sum, offset); // Warp shuffle for reduction
        }
        if (threadIdx.x == 0) {
            target[blockIdx.x] = sum; // Store result
        }
    }
}
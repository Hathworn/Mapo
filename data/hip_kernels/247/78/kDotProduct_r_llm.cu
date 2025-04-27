#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kDotProduct_r(float* a, float* b, float* target, const uint numCols, const uint numElements) {
    __shared__ float shmem[DP_BLOCKSIZE];

    uint eidx = DP_BLOCKSIZE * blockIdx.x + threadIdx.x;
    float sum = 0.0f;
    if (eidx < numCols) {
        for (; eidx < numElements; eidx += numCols) {
            sum += a[eidx] * b[eidx];
        }
    }
    shmem[threadIdx.x] = sum; // Store sum in shared memory
    __syncthreads();

    // Unroll loop for reduction
    for (int offset = DP_BLOCKSIZE / 2; offset > 0; offset >>= 1) {
        if (threadIdx.x < offset) {
            shmem[threadIdx.x] += shmem[threadIdx.x + offset];
        }
        __syncthreads();
    }

    // Write result for this block to global memory
    if (threadIdx.x == 0) {
        target[blockIdx.x] = shmem[0];
    }
}
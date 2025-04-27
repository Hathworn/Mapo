#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kDotProduct_r(float* a, float* b, float* target, const uint numElements) {
    __shared__ float shmem[DP_BLOCKSIZE];

    uint eidx = DP_BLOCKSIZE * blockIdx.x + threadIdx.x;
    shmem[threadIdx.x] = 0;

    // Unrolling the loop for better performance
    if (eidx < numElements) {
        unsigned int stride = gridDim.x * DP_BLOCKSIZE;
        while (eidx < numElements) {
            shmem[threadIdx.x] += a[eidx] * b[eidx];
            eidx += stride;
        }
    }

    __syncthreads();

    // Reduce the requirement for many __syncthreads() by using warp shuffle instructions
    if (threadIdx.x < 32) {
        for (int offset = 32; offset > 0; offset /= 2) {
            shmem[threadIdx.x] += __shfl_down_sync(0xffffffff, shmem[threadIdx.x], offset);
        }

        // Final result is written to global memory by the first thread
        if (threadIdx.x == 0) {
            target[blockIdx.x] = shmem[0];
        }
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kDotProduct_r(float* a, float* b, float* target, const uint numCols, const uint numElements) {
    __shared__ float shmem[DP_BLOCKSIZE];

    // Improved index calculation to prevent out-of-bound access
    uint eidx = DP_BLOCKSIZE * blockIdx.x + threadIdx.x;
    float sum = 0.0f;

    // Efficient memory access within valid range
    if (eidx < numElements) {
        for (uint idx = eidx; idx < numElements; idx += numCols) {
            sum += a[idx] * b[idx];
        }
    }

    shmem[threadIdx.x] = sum;
    __syncthreads();

    // Unroll reduction with warp-level convergence
    for (uint stride = DP_BLOCKSIZE / 2; stride > 0; stride >>= 1) {
        if (threadIdx.x < stride) {
            shmem[threadIdx.x] += shmem[threadIdx.x + stride];
        }
        __syncthreads();
    }

    // Write block result to global memory
    if (threadIdx.x == 0) {
        target[blockIdx.x] = shmem[0];
    }
}
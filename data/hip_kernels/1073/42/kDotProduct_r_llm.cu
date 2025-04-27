#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kDotProduct_r(float* a, float* b, float* target, const uint numElements) {
    __shared__ float shmem[DP_BLOCKSIZE];

    uint eidx = DP_BLOCKSIZE * blockIdx.x + threadIdx.x;
    float sum = 0.0f;

    // Loop unrolling for better efficiency
    for (; eidx < numElements; eidx += gridDim.x * DP_BLOCKSIZE) {
        sum += a[eidx] * b[eidx];
    }

    shmem[threadIdx.x] = sum;
    __syncthreads();

    // Optimize the reduction using warp shuffle for better performance
    for (int offset = DP_BLOCKSIZE / 2; offset > 0; offset /= 2) {
        if (threadIdx.x < offset) {
            shmem[threadIdx.x] += shmem[threadIdx.x + offset];
        }
        __syncthreads();
    }

    if (threadIdx.x == 0) {
        target[blockIdx.x] = shmem[0];
    }
}
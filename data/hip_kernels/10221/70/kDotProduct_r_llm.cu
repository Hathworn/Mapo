#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kDotProduct_r(float* a, float* b, float* target, const uint numElements) {
    __shared__ float shmem[DP_BLOCKSIZE];

    uint eidx = DP_BLOCKSIZE * blockIdx.x + threadIdx.x;
    float sum = 0.0f;

    // Loop unrolling for memory access coalescing and reduced loop iterations
    while (eidx < numElements) {
        sum += a[eidx] * b[eidx];
        if (eidx + blockDim.x < numElements) sum += a[eidx + blockDim.x] * b[eidx + blockDim.x];
        eidx += gridDim.x * DP_BLOCKSIZE * 2;
    }
    
    shmem[threadIdx.x] = sum;
    __syncthreads();

    // Efficient parallel reduction using warp shuffle
    for (int offset = blockDim.x / 2; offset > 0; offset >>= 1) {
        if (threadIdx.x < offset) {
            shmem[threadIdx.x] += shmem[threadIdx.x + offset];
        }
        __syncthreads();
    }

    // Write result of block to global memory
    if (threadIdx.x == 0) {
        target[blockIdx.x] = shmem[0];
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kDotProduct_r(float* a, float* b, float* target,  const uint numElements) {
    __shared__ float shmem[DP_BLOCKSIZE];

    uint eidx = DP_BLOCKSIZE * blockIdx.x + threadIdx.x;
    float sum = 0.0f;

    // Loop unrolling and avoiding branch divergence
    while (eidx < numElements) {
        sum += a[eidx] * b[eidx];
        eidx += gridDim.x * DP_BLOCKSIZE;
    }
    shmem[threadIdx.x] = sum;
    __syncthreads();

    // Efficient reduction within a warp
    if (threadIdx.x < 256) { shmem[threadIdx.x] += shmem[threadIdx.x + 256]; } __syncthreads();
    if (threadIdx.x < 128) { shmem[threadIdx.x] += shmem[threadIdx.x + 128]; } __syncthreads();
    if (threadIdx.x < 64) { shmem[threadIdx.x] += shmem[threadIdx.x + 64]; } __syncthreads();

    if (threadIdx.x < 32) {
        volatile float* mysh = shmem;
        mysh[threadIdx.x] += mysh[threadIdx.x + 32];
        mysh[threadIdx.x] += mysh[threadIdx.x + 16];
        mysh[threadIdx.x] += mysh[threadIdx.x + 8];
        mysh[threadIdx.x] += mysh[threadIdx.x + 4];
        mysh[threadIdx.x] += mysh[threadIdx.x + 2];
        mysh[threadIdx.x] += mysh[threadIdx.x + 1];
    }

    // Only the first thread in the block writes to the target
    if (threadIdx.x == 0) {
        target[blockIdx.x] = shmem[0];
    }
}
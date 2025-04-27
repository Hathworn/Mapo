#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kDotProduct_r(float* a, float* b, float* target, const uint numElements) {
    __shared__ float shmem[DP_BLOCKSIZE];

    uint eidx = DP_BLOCKSIZE * blockIdx.x + threadIdx.x;
    float sum = 0; // Use a register for accumulation

    // Unroll comparison and blocking accesses
    while (eidx < numElements) {
        sum += a[eidx] * b[eidx];
        eidx += gridDim.x * DP_BLOCKSIZE;
    }
    shmem[threadIdx.x] = sum; // Store in shared memory

    __syncthreads();

    // Use loop for reduction with warp-synchronous programming
    for (uint stride = DP_BLOCKSIZE / 2; stride > 32; stride >>= 1) {
        if (threadIdx.x < stride) {
            shmem[threadIdx.x] += shmem[threadIdx.x + stride];
        }
        __syncthreads();
    }

    // Warp-level reduction
    if (threadIdx.x < 32) {
        volatile float* mysh = &shmem[threadIdx.x];
        mysh[0] += mysh[32];
        mysh[0] += mysh[16];
        mysh[0] += mysh[8];
        mysh[0] += mysh[4];
        mysh[0] += mysh[2];
        mysh[0] += mysh[1];
    }

    // Store result for this block
    if (threadIdx.x == 0) {
        target[blockIdx.x] = shmem[0];
    }
}
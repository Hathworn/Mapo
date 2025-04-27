#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kDotProduct_r(float* a, float* b, float* target, const uint numElements) {
    __shared__ float shmem[DP_BLOCKSIZE];

    uint eidx = DP_BLOCKSIZE * blockIdx.x + threadIdx.x;
    float sum = 0;  // Use a register for partial sum

    while (eidx < numElements) {
        sum += a[eidx] * b[eidx];  // Accumulate partial products in a register
        eidx += gridDim.x * DP_BLOCKSIZE;
    }

    shmem[threadIdx.x] = sum;  // Store the partial sum in shared memory
    __syncthreads();

    // Unroll the loop for reduction
    if (threadIdx.x < 128) {
        shmem[threadIdx.x] += shmem[threadIdx.x + 128];
    }
    __syncthreads();
    if (threadIdx.x < 64) {
        shmem[threadIdx.x] += shmem[threadIdx.x + 64];
    }
    __syncthreads();
    if (threadIdx.x < 32) {
        volatile float* mysh = &shmem[threadIdx.x];
        mysh[0] += mysh[32];
        mysh[0] += mysh[16];
        mysh[0] += mysh[8];
        mysh[0] += mysh[4];
        mysh[0] += mysh[2];
        mysh[0] += mysh[1];
    }

    // Only the first thread writes the result to the target array
    if (threadIdx.x == 0) {
        target[blockIdx.x] = shmem[0];
    }
}
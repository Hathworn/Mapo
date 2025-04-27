#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kDotProduct_r(float* a, float* b, float* target, const uint numElements) {
    __shared__ float shmem[DP_BLOCKSIZE];
    uint eidx = DP_BLOCKSIZE * blockIdx.x + threadIdx.x;

    // Initialize shared memory with zero
    shmem[threadIdx.x] = 0;

    // Efficient boundary check and dot product calculation
    if (eidx < numElements) {
        for (uint i = eidx; i < numElements; i += gridDim.x * DP_BLOCKSIZE) {
            shmem[threadIdx.x] += a[i] * b[i];
        }
    }
    __syncthreads();

    // Unrolling tree-based reduction logic
    if (threadIdx.x < 128) shmem[threadIdx.x] += shmem[threadIdx.x + 128];
    __syncthreads();
    if (threadIdx.x < 64) shmem[threadIdx.x] += shmem[threadIdx.x + 64];
    __syncthreads();
    if (threadIdx.x < 32) {
        // Use volatile to prevent optimization issues in warp reduction
        volatile float* mysh = shmem;
        mysh[threadIdx.x] += mysh[threadIdx.x + 32];
        mysh[threadIdx.x] += mysh[threadIdx.x + 16];
        mysh[threadIdx.x] += mysh[threadIdx.x + 8];
        mysh[threadIdx.x] += mysh[threadIdx.x + 4];
        mysh[threadIdx.x] += mysh[threadIdx.x + 2];
        mysh[threadIdx.x] += mysh[threadIdx.x + 1];
        if (threadIdx.x == 0) {
            target[blockIdx.x] = mysh[0];
        }
    }
}
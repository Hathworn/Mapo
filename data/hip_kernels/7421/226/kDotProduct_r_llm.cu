#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kDotProduct_r(float* a, float* b, float* target, const uint numElements) {
    __shared__ float shmem[DP_BLOCKSIZE];

    uint eidx = DP_BLOCKSIZE * blockIdx.x + threadIdx.x;
    float localSum = 0; // Use a register to hold local accumulation
    if (eidx < numElements) { // Correct boundary condition check
        for (; eidx < numElements; eidx += gridDim.x * DP_BLOCKSIZE) {
            localSum += a[eidx] * b[eidx];
        }
    }
    shmem[threadIdx.x] = localSum;
    __syncthreads();
    
    // Unroll the loop for reduction
    if (threadIdx.x < 256) shmem[threadIdx.x] += shmem[threadIdx.x + 256];
    __syncthreads();
    if (threadIdx.x < 128) shmem[threadIdx.x] += shmem[threadIdx.x + 128];
    __syncthreads();
    if (threadIdx.x < 64) shmem[threadIdx.x] += shmem[threadIdx.x + 64];
    __syncthreads();
    
    // Reduce within a warp without using __syncthreads(), utilize warp intrinsic
    if (threadIdx.x < 32) {
        volatile float* mysh = shmem;
        mysh[threadIdx.x] += mysh[threadIdx.x + 32];
        mysh[threadIdx.x] += mysh[threadIdx.x + 16];
        mysh[threadIdx.x] += mysh[threadIdx.x + 8];
        mysh[threadIdx.x] += mysh[threadIdx.x + 4];
        mysh[threadIdx.x] += mysh[threadIdx.x + 2];
        mysh[threadIdx.x] += mysh[threadIdx.x + 1];
    }

    if (threadIdx.x == 0) {
        target[blockIdx.x] = shmem[0]; // Use the first element of shared memory to store result
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kDotProduct_r(float* a, float* b, float* target, const uint numElements) {
    __shared__ float shmem[DP_BLOCKSIZE];

    // Calculate unique index
    uint eidx = DP_BLOCKSIZE * blockIdx.x + threadIdx.x;

    // Initialize shared memory; Load elements if in range
    float sum = 0;
    if (eidx < numElements) {
        for (; eidx < numElements; eidx += gridDim.x * DP_BLOCKSIZE) {
            sum += a[eidx] * b[eidx];
        }
    }
    shmem[threadIdx.x] = sum;
    __syncthreads();

    // Reduce within block
    if (threadIdx.x < 128) shmem[threadIdx.x] += shmem[threadIdx.x + 128];
    __syncthreads();
    if (threadIdx.x < 64) shmem[threadIdx.x] += shmem[threadIdx.x + 64];
    __syncthreads();

    // Efficient warp-level reduction using volatile pointers
    if (threadIdx.x < 32) {
        volatile float* mysh = shmem;
        mysh[threadIdx.x] += mysh[threadIdx.x + 32];
        mysh[threadIdx.x] += mysh[threadIdx.x + 16];
        mysh[threadIdx.x] += mysh[threadIdx.x + 8];
        mysh[threadIdx.x] += mysh[threadIdx.x + 4];
        mysh[threadIdx.x] += mysh[threadIdx.x + 2];
        mysh[threadIdx.x] += mysh[threadIdx.x + 1];
        
        // Store result for this block in global memory
        if (threadIdx.x == 0) {
            target[blockIdx.x] = mysh[0];
        }
    }
}
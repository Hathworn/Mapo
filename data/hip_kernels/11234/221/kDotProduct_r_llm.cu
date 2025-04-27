#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kDotProduct_r(float* a, float* b, float* target, const uint numElements) {
    __shared__ float shmem[DP_BLOCKSIZE];

    uint eidx = DP_BLOCKSIZE * blockIdx.x + threadIdx.x;
    shmem[threadIdx.x] = 0;
    
    // Ensure that the loop boundary checks with actual numElements
    if (eidx < numElements) {
        // Unroll loop for better performance
        for (; eidx < numElements; eidx += gridDim.x * DP_BLOCKSIZE) {
            shmem[threadIdx.x] += a[eidx] * b[eidx];
        }
    }
    __syncthreads();

    // Optimize reduction using a single warp for final steps
    if (threadIdx.x < 256) {
        shmem[threadIdx.x] += shmem[threadIdx.x + 256];
    }
    __syncthreads();
    if (threadIdx.x < 128) {
        shmem[threadIdx.x] += shmem[threadIdx.x + 128];
    }
    __syncthreads();
    if (threadIdx.x < 64) {
        shmem[threadIdx.x] += shmem[threadIdx.x + 64];
    }
    __syncthreads();

    // Use warp shuffle operations for faster reduction
    if (threadIdx.x < 32) {
        volatile float* mysh = &shmem[threadIdx.x];
        *mysh += mysh[32];
        *mysh += mysh[16];
        *mysh += mysh[8];
        *mysh += mysh[4];
        *mysh += mysh[2];
        *mysh += mysh[1];
    }

    // Write result from the first thread of the block
    if (threadIdx.x == 0) {
        target[blockIdx.x] = shmem[0];
    }
}
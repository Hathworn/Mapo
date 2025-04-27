#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kDotProduct_r(float* a, float* b, float* target, const uint numElements) {
    __shared__ float shmem[DP_BLOCKSIZE];

    uint eidx = DP_BLOCKSIZE * blockIdx.x + threadIdx.x;
    float local_sum = 0.0f;

    // loop to process all required elements
    for (; eidx < numElements; eidx += gridDim.x * DP_BLOCKSIZE) {
        local_sum += a[eidx] * b[eidx];
    }
    shmem[threadIdx.x] = local_sum; // store local sum to shared memory
    __syncthreads();

    // unrolled reduction in shared memory
    if (threadIdx.x < 256) shmem[threadIdx.x] += shmem[threadIdx.x + 256];
    __syncthreads();
    if (threadIdx.x < 128) shmem[threadIdx.x] += shmem[threadIdx.x + 128];
    __syncthreads();
    if (threadIdx.x < 64) shmem[threadIdx.x] += shmem[threadIdx.x + 64];
    __syncthreads();
    
    if (threadIdx.x < 32) {
        volatile float* mysh = shmem; // use volatile to prevent compiler optimization issues
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
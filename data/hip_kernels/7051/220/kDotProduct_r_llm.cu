#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kDotProduct_r(float* a, float* b, float* target, const uint numElements) {
    __shared__ float shmem[DP_BLOCKSIZE];

    uint eidx = DP_BLOCKSIZE * blockIdx.x + threadIdx.x;
    float temp = 0.0f;

    // Accumulate results to temp to reduce shared memory bank conflicts
    if (eidx < numElements) {
        for (; eidx < numElements; eidx += gridDim.x * DP_BLOCKSIZE) {
            temp += a[eidx] * b[eidx];
        }
    }
    shmem[threadIdx.x] = temp;
    __syncthreads();

    // Use unrolling for faster reduction in shared memory
    if (threadIdx.x < 256) shmem[threadIdx.x] += shmem[threadIdx.x + 256];
    __syncthreads();
    if (threadIdx.x < 128) shmem[threadIdx.x] += shmem[threadIdx.x + 128];
    __syncthreads();
    if (threadIdx.x < 64) shmem[threadIdx.x] += shmem[threadIdx.x + 64];
    __syncthreads();

    // Utilize warp shuffle for final reduction within a warp
    if (threadIdx.x < 32) {
        volatile float* mysh = shmem; // Access shared memory as volatile to prevent compiler optimization issues
        mysh[threadIdx.x] += mysh[threadIdx.x + 32];
        mysh[threadIdx.x] += mysh[threadIdx.x + 16];
        mysh[threadIdx.x] += mysh[threadIdx.x + 8];
        mysh[threadIdx.x] += mysh[threadIdx.x + 4];
        mysh[threadIdx.x] += mysh[threadIdx.x + 2];
        mysh[threadIdx.x] += mysh[threadIdx.x + 1];
    }

    // Only the first thread writes the result back
    if (threadIdx.x == 0) {
        target[blockIdx.x] = shmem[0];
    }
}
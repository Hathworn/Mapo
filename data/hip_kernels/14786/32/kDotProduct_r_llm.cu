#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kDotProduct_r(float* a, float* b, float* target, const uint numCols, const uint numElements) {
    __shared__ float shmem[DP_BLOCKSIZE];
    
    uint eidx = DP_BLOCKSIZE * blockIdx.x + threadIdx.x;
    float sum = 0.0f;

    // Unrolling loop for better performance
    if (eidx < numCols) {
        for (; eidx < numElements; eidx += numCols) {
            sum += a[eidx] * b[eidx];
        }
    }
    
    shmem[threadIdx.x] = sum;
    __syncthreads();
    
    // Optimize the reduction by using a single warp
    if (blockDim.x >= 512) { if (threadIdx.x < 256) shmem[threadIdx.x] += shmem[threadIdx.x + 256]; __syncthreads(); }
    if (blockDim.x >= 256) { if (threadIdx.x < 128) shmem[threadIdx.x] += shmem[threadIdx.x + 128]; __syncthreads(); }
    if (blockDim.x >= 128) { if (threadIdx.x < 64) shmem[threadIdx.x] += shmem[threadIdx.x + 64]; __syncthreads(); }
    
    // Use warp shuffle for final warp reduction
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
        target[blockIdx.x] = shmem[0];
    }
}
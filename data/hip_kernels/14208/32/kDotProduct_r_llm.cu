#include "hip/hip_runtime.h"
#include "includes.h"

#define DP_BLOCKSIZE 512

__global__ void kDotProduct_r(float* a, float* b, float* target, const uint numCols, const uint numElements) {
    __shared__ float shmem[DP_BLOCKSIZE];
    
    uint eidx = DP_BLOCKSIZE * blockIdx.x + threadIdx.x;
    float sum = 0.0f;
    
    // Load elements into shared memory and calculate partial dot products
    if (eidx < numCols) {
        for (; eidx < numElements; eidx += numCols) {
            sum += a[eidx] * b[eidx];
        }
    }
    
    shmem[threadIdx.x] = sum;
    __syncthreads();
    
    // Perform reduction using binary tree method within warp to reduce total memory accesses
    for (int i = blockDim.x / 2; i > 0; i >>= 1) {
        if (threadIdx.x < i) {
            shmem[threadIdx.x] += shmem[threadIdx.x + i];
        }
        __syncthreads();
    }
    
    // Write the result of this block's dot product reduction to global memory
    if (threadIdx.x == 0) {
        target[blockIdx.x] = shmem[0];
    }
}
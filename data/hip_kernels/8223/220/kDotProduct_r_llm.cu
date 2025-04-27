#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kDotProduct_r(float* a, float* b, float* target, const uint numElements) {
    __shared__ float shmem[DP_BLOCKSIZE];
    
    uint eidx = DP_BLOCKSIZE * blockIdx.x + threadIdx.x;
    float sum = 0.0f;

    // Unrolling the loop for better performance
    for (; eidx < numElements; eidx += gridDim.x * DP_BLOCKSIZE) {
        sum += a[eidx] * b[eidx];
    }
    shmem[threadIdx.x] = sum;
    __syncthreads();
     
    // Use a single loop to combine addition operations
    for (uint offset = DP_BLOCKSIZE / 2; offset > 0; offset >>= 1) {
        if (threadIdx.x < offset) {
            shmem[threadIdx.x] += shmem[threadIdx.x + offset];
        }
        __syncthreads();
    }
    
    // Store the result in the target array
    if (threadIdx.x == 0) {
        target[blockIdx.x] = shmem[0];
    }
}
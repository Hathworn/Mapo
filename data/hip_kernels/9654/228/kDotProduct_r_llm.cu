#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kDotProduct_r(float* a, float* b, float* target, const uint numElements) {
    __shared__ float shmem[DP_BLOCKSIZE];
    
    uint eidx = DP_BLOCKSIZE * blockIdx.x + threadIdx.x;
    float sum = 0.0f; // Accumulate in a register
    while (eidx < numElements) {
        sum += a[eidx] * b[eidx];
        eidx += gridDim.x * DP_BLOCKSIZE;
    }
    shmem[threadIdx.x] = sum;
    __syncthreads();
    
    // Use a loop to perform reduction instead of unrolling manually
    for (uint stride = DP_BLOCKSIZE / 2; stride > 0; stride /= 2) {
        if (threadIdx.x < stride) {
            shmem[threadIdx.x] += shmem[threadIdx.x + stride];
        }
        __syncthreads();
    }
    
    // Write result from the first thread in the block
    if (threadIdx.x == 0) {
        target[blockIdx.x] = shmem[0];
    }
}
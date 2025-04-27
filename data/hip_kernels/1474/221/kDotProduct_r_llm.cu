#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kDotProduct_r(float* a, float* b, float* target, const uint numElements) {
    __shared__ float shmem[DP_BLOCKSIZE];
    
    uint tid = threadIdx.x;
    uint eidx = DP_BLOCKSIZE * blockIdx.x + tid;
    shmem[tid] = 0.0f;
    
    // Unroll the loop to improve memory throughput
    for (; eidx < numElements; eidx += gridDim.x * DP_BLOCKSIZE) {
        shmem[tid] += a[eidx] * b[eidx];
    }

    __syncthreads();

    // Use a loop for the reductions to improve readability and conciseness
    for (uint stride = DP_BLOCKSIZE / 2; stride > 0; stride >>= 1) {
        if (tid < stride) {
            shmem[tid] += shmem[tid + stride];
        }
        __syncthreads();
    }
    
    // The final result is stored only by the first thread in the block
    if (tid == 0) {
        target[blockIdx.x] = shmem[0];
    }
}
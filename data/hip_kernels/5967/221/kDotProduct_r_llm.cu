#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kDotProduct_r(float* a, float* b, float* target, const uint numElements) {
    __shared__ float shmem[DP_BLOCKSIZE];

    // Calculate the global index for the current thread
    uint eidx = DP_BLOCKSIZE * blockIdx.x + threadIdx.x;

    // Initialize shared memory for this thread
    shmem[threadIdx.x] = 0;

    // Unroll the loop to reduce the number of iterations, optimizing memory access
    for (uint offset = eidx; offset < numElements; offset += gridDim.x * DP_BLOCKSIZE) {
        shmem[threadIdx.x] += a[offset] * b[offset];
    }

    __syncthreads();

    // Optimize reduction within the block using warp shuffle operations
    #pragma unroll
    for (uint offset = warpSize/2; offset > 0; offset /= 2) {
        shmem[threadIdx.x] += __shfl_down_sync(0xffffffff, shmem[threadIdx.x], offset);
    }

    // Write the result of this block's reduction to the target array
    if (threadIdx.x == 0) {
        target[blockIdx.x] = shmem[0];
    }
}
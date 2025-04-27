#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kDotProduct_r(float* a, float* b, float* target, const uint numElements) {
    __shared__ float shmem[DP_BLOCKSIZE];

    uint tid = threadIdx.x;
    uint eidx = DP_BLOCKSIZE * blockIdx.x + tid;
    
    // Initialize shared memory for this thread
    float sum = 0.0f;

    // Each thread handles multiple elements for better memory coalescing
    for (; eidx < numElements; eidx += gridDim.x * DP_BLOCKSIZE) {
        sum += a[eidx] * b[eidx];
    }
    
    // Store the sum in shared memory
    shmem[tid] = sum;

    // Reduction using shared memory
    __syncthreads();
    // Optimized reduction loop for power of two block sizes
    for (uint stride = DP_BLOCKSIZE / 2; stride > 0; stride /= 2) {
        if (tid < stride) {
            shmem[tid] += shmem[tid + stride];
        }
        __syncthreads();
    }

    // Write the result to the target
    if (tid == 0) {
        target[blockIdx.x] = shmem[0];
    }
}
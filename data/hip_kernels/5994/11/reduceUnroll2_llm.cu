#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduceUnroll2(int *g_idata, int *g_odata, unsigned int n) {
    // Combined index for both operations in one step
    int idx = blockIdx.x * blockDim.x * 2 + threadIdx.x;
    // Use a shared memory buffer for intra-block reduction
    extern __shared__ int smem[];

    // Load data into shared memory, ensure no out of bounds access
    if (idx < n) smem[threadIdx.x] = g_idata[idx] + (idx + blockDim.x < n ? g_idata[idx + blockDim.x] : 0);
    else smem[threadIdx.x] = 0;  // Handle situations where idx might be out of bounds

    __syncthreads();

    // Perform reduction using shared memory
    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
        if (threadIdx.x < stride) {
            smem[threadIdx.x] += smem[threadIdx.x + stride];
        }
        __syncthreads();
    }

    // Write result for this block to global memory
    if (threadIdx.x == 0) {
        g_odata[blockIdx.x] = smem[0];
    }
}
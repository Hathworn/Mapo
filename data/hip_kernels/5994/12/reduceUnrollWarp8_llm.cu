#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduceUnrollWarp8(int *g_idata, int *g_odata, unsigned int n) {
    // Get thread id
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Data pointer of this block
    int *idata = g_idata + blockIdx.x * blockDim.x * 8;
    
    // Unrolling blocks
    if (idx + 7 * blockDim.x < n) {
        int el0 = g_idata[idx];
        int el1 = g_idata[idx + blockDim.x];
        int el2 = g_idata[idx + 2 * blockDim.x];
        int el3 = g_idata[idx + 3 * blockDim.x];
        int el4 = g_idata[idx + 4 * blockDim.x];
        int el5 = g_idata[idx + 5 * blockDim.x];
        int el6 = g_idata[idx + 6 * blockDim.x];
        int el7 = g_idata[idx + 7 * blockDim.x];
        g_idata[idx] = el0 + el1 + el2 + el3 + el4 + el5 + el6 + el7;
    }
    
    __syncthreads();
    
    // Thread id out of range
    if (idx >= n) return;

    // Use shared memory for intermediate results
    __shared__ int smem[256];
    smem[threadIdx.x] = idata[threadIdx.x];
    __syncthreads();

    // Optimize reduction using single loop
    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
        if (threadIdx.x < stride) {
            smem[threadIdx.x] += smem[threadIdx.x + stride];
        }
        __syncthreads();
    }

    // Only thread 0 writes the result for the block
    if (threadIdx.x == 0) {
        g_odata[blockIdx.x] = smem[0];
    }
}
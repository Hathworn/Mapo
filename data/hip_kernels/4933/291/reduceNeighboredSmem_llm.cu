#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reduceNeighboredSmem(int *g_idata, int *g_odata, unsigned int n)
{
    __shared__ int smem[DIM];
    
    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x + tid;
    
    // Check if index is within bounds and load data into shared memory
    if (idx < n) {
        smem[tid] = g_idata[idx];
    } else {
        smem[tid] = 0;
    }
    __syncthreads();
    
    // Perform in-place reduction using shared memory
    for (unsigned int stride = 1; stride < blockDim.x; stride *= 2) {
        // Ensure stride doesn't access out of bound memory
        if (tid % (2 * stride) == 0 && (tid + stride) < blockDim.x) {
            smem[tid] += smem[tid + stride];
        }
        __syncthreads();
    }
    
    // Write the result for this block to global memory
    if (tid == 0) {
        g_odata[blockIdx.x] = smem[0];
    }
}
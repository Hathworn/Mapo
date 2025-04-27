#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduce(int *g_idata, int *g_odata) {
    __shared__ int sdata[256];

    // Load data into shared memory with bounds check
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < 256) {
        sdata[threadIdx.x] = g_idata[i];
    } else {
        sdata[threadIdx.x] = 0;
    }
    
    __syncthreads();

    // Perform reduction in shared memory
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1) { // Reduce total iterations
        if (threadIdx.x < s) {
            sdata[threadIdx.x] += sdata[threadIdx.x + s];
        }
        __syncthreads();
    }

    // Write result for this block to global memory
    if (threadIdx.x == 0) {
        atomicAdd(g_odata, sdata[0]);
    }
}
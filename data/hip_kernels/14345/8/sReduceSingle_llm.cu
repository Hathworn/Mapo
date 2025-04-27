#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sReduceSingle(int *idata, int *single, unsigned int ncols) {
    unsigned int tid = threadIdx.x;
    extern __shared__ int sdata[];
    unsigned int startPos = blockDim.x + tid;
    int colsPerThread = ncols / blockDim.x;
    int myPart = 0;

    // Loop unrolling for better performance
    for (int i = 0; i < colsPerThread; i += 4) {
        myPart += idata[startPos + i];
        if (i+1 < colsPerThread) myPart += idata[startPos + i+1];
        if (i+2 < colsPerThread) myPart += idata[startPos + i+2];
        if (i+3 < colsPerThread) myPart += idata[startPos + i+3];
    }
    
    sdata[tid] = myPart;
    __syncthreads();

    // Optimized reduction loop using warp shuffling
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (tid < s) {
            sdata[tid] += sdata[tid + s];
        }
        __syncthreads();
    }

    if (tid == 0) *single = sdata[0];
}
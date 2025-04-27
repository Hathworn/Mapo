#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void iReduceSingle(int *idata, int *single, int ncols) {
    unsigned int tid = threadIdx.x;
    extern __shared__ int sdata[];

    int colsPerThread = ncols / blockDim.x;
    int myPart = 0;

    // Optimize the initial reduction within the block
    for (int i = tid; i < ncols; i += blockDim.x) {
        myPart += idata[i];
    }
    sdata[tid] = myPart;
    __syncthreads();

    // Unroll the loop for intra-block reduction to achieve better parallel performance
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (tid < s) {
            sdata[tid] += sdata[tid + s];
        }
        __syncthreads();
    }

    // Write the block's result back to global memory
    if (tid == 0) *single = sdata[0];
}
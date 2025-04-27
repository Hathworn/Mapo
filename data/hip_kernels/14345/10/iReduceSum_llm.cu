#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void iReduceSum(int *idata, int *odata, unsigned int ncols) {
    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x + tid;
    extern __shared__ int sdata[];

    int myPart = 0;
    int colsPerThread = ncols / (gridDim.x * blockDim.x);

    // Load input elements into shared memory and accumulate
    for(int i = 0; i < colsPerThread; i++) {
        myPart += idata[idx + i * blockDim.x];
    }
    sdata[tid] = myPart;
    __syncthreads();

    // Perform reduction in shared memory
    for(unsigned int s = blockDim.x / 2; s > 0; s >>= 1) {
        if(tid < s) {
            sdata[tid] += sdata[tid + s];
        }
        __syncthreads();
    }

    // Write result for this block to global memory
    if(tid == 0) {
        odata[blockIdx.x] = sdata[0];
    }
}
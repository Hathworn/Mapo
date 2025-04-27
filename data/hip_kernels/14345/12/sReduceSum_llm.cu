#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sReduceSum(int *idata, int *odata, unsigned int ncols) {
    unsigned int tid = threadIdx.x;
    unsigned int colsPerThread = ncols / blockDim.x;
    unsigned int blockOffset = blockIdx.x * ncols + tid * colsPerThread;
    
    // Use shared memory initialization and avoid redundant memory assignments
    extern __shared__ int sdata[];
    int myPart = 0;

    // Unroll loops for better performance
    for (unsigned int i = 0; i < colsPerThread; i++) {
        myPart += idata[blockOffset + i];
    }
    sdata[tid] = myPart;
    __syncthreads();

    // Optimize reduction with loop unrolling
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (tid < s) {
            sdata[tid] += sdata[tid + s];
        }
        __syncthreads();
    }

    // Write result to global memory
    if (tid == 0) {
        odata[blockIdx.x] = sdata[0];
    }
}
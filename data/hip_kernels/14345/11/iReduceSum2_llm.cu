#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void iReduceSum2(int *idata, int *odata, unsigned int ncols) {
    // Calculate thread ID and block offset
    unsigned int tid = threadIdx.x;
    unsigned int startPos = blockDim.x * blockIdx.x;
    extern __shared__ int sdata[];

    // Calculate number of elements per thread and block offset
    int colsPerThread = (ncols + blockDim.x - 1) / blockDim.x; // Use ceiling to cover all elements
    int blockOffset = tid * colsPerThread;

    // Initialize partial sum for each thread
    int myPart = 0;
    for(int i = 0; i < colsPerThread && blockOffset + startPos + i < ncols; i++) {
        myPart += idata[blockOffset + startPos + i];
    }

    // Each thread writes its partial result to shared memory
    sdata[tid] = myPart;
    __syncthreads();

    // Perform parallel reduction within block
    for(unsigned int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (tid < s) {
            sdata[tid] += sdata[tid + s];
        }
        __syncthreads();
    }

    // Write result of block reduction to odata
    if(tid == 0) odata[blockIdx.x] = sdata[0];
}
```

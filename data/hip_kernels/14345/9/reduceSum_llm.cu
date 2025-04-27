#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduceSum(int *idata, int *odata, unsigned int ncols)
{
    // Use shared memory for partial sums
    extern __shared__ int sharedData[];
    int *sdata = sharedData;

    int tid = threadIdx.x;
    int blockOffset = blockIdx.x * ncols;
    int rowStartPos = tid * (ncols / blockDim.x);
    int colsPerThread = ncols / blockDim.x;

    int *mypart = idata + blockOffset + rowStartPos;

    // Load data into shared memory
    sdata[tid] = mypart[0];
    for (int i = 1; i < colsPerThread; i++) {
        sdata[tid] += mypart[i];
    }
    __syncthreads(); // Ensure all loads are done

    // Parallel reduction within a block
    for (int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (tid < s) {
            sdata[tid] += sdata[tid + s];
        }
        __syncthreads(); // Ensure all adds are done
    }

    // Save the final result from each block
    if (tid == 0) {
        odata[blockIdx.x] = sdata[0];
    }
}
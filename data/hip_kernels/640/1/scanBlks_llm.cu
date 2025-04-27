#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scanBlks(unsigned int *in, unsigned int *out, unsigned int n, unsigned int *blkSums)
{
    extern __shared__ int blkData[];
    int i1 = blockIdx.x * 2 * blockDim.x + threadIdx.x;
    int i2 = i1 + blockDim.x;

    // Load input into shared memory
    if (i1 < n) blkData[threadIdx.x] = in[i1];
    else blkData[threadIdx.x] = 0; // Handle boundary

    if (i2 < n) blkData[threadIdx.x + blockDim.x] = in[i2];
    else blkData[threadIdx.x + blockDim.x] = 0; // Handle boundary

    __syncthreads();

    // Up-sweep phase
    for (int stride = 1; stride < 2 * blockDim.x; stride *= 2) {
        int index = (threadIdx.x + 1) * 2 * stride - 1;

        if (index < 2 * blockDim.x) 
            blkData[index] += blkData[index - stride];

        __syncthreads();
    }

    // Down-sweep phase
    for (int stride = blockDim.x / 2; stride > 0; stride /= 2) {
        int index = (threadIdx.x + 1) * 2 * stride - 1 + stride;

        if (index < 2 * blockDim.x) 
            blkData[index] += blkData[index - stride];

        __syncthreads();
    }

    // Write results to global memory
    if (i1 < n) out[i1] = blkData[threadIdx.x];
    if (i2 < n) out[i2] = blkData[threadIdx.x + blockDim.x];

    // Store block sums for further processing
    if (blkSums != NULL && threadIdx.x == 0) 
        blkSums[blockIdx.x] = blkData[2 * blockDim.x - 1];
}
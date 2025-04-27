#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scanBlks(unsigned int *in, unsigned int *out, unsigned int n, unsigned int *blkSums)
{
    extern __shared__ int blkData[];
    int i1 = blockIdx.x * 2 * blockDim.x + threadIdx.x;
    int i2 = i1 + blockDim.x;

    // Load data to shared memory and zero-pad if necessary
    blkData[threadIdx.x] = (i1 < n) ? in[i1] : 0;
    blkData[threadIdx.x + blockDim.x] = (i2 < n) ? in[i2] : 0;
    __syncthreads();

    // Up-sweep phase
    for (int stride = 1; stride < 2 * blockDim.x; stride *= 2)
    {
        int blkDataIdx = (threadIdx.x + 1) * 2 * stride - 1;
        if (blkDataIdx < 2 * blockDim.x)
            blkData[blkDataIdx] += blkData[blkDataIdx - stride];
        __syncthreads();
    }

    // Down-sweep phase
    for (int stride = blockDim.x / 2; stride > 0; stride /= 2)
    {
        int blkDataIdx = (threadIdx.x + 1) * 2 * stride - 1 + stride;
        if (blkDataIdx < 2 * blockDim.x)
            blkData[blkDataIdx] += blkData[blkDataIdx - stride];
        __syncthreads();
    }

    // Write the results to the output array
    if (i1 < n) out[i1] = blkData[threadIdx.x];
    if (i2 < n) out[i2] = blkData[threadIdx.x + blockDim.x];

    // Store block sum to blkSums
    if (blkSums != NULL && threadIdx.x == 0)
        blkSums[blockIdx.x] = blkData[2 * blockDim.x - 1];
}
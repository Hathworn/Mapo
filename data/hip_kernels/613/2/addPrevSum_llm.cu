#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize kernel to add previous block sum to current block scan results
__global__ void addPrevSum(unsigned int* blkSumsScan, unsigned int* blkScans, unsigned int n)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < n && threadIdx.x >= blockDim.x)
    {
        // Add the prefix sum of previous blocks to current block scans
        blkScans[i] += blkSumsScan[blockIdx.x - 1];
    }
}
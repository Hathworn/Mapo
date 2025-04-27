#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addPrevSum(unsigned int* blkSumsScan, unsigned int* blkScans, unsigned int n)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x; 
    
    // Iterate over threads to process multiple elements
    while (i < n)
    {
        blkScans[i] += blkSumsScan[blockIdx.x];
        i += blockDim.x * gridDim.x; // Advance by total number of threads
    }
}
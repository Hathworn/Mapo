#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void incSumScanB1_kernel(unsigned int* d_outVals, unsigned int* d_inVals, size_t numVals, unsigned int* d_blockOffset, unsigned int valOffset)
{
    unsigned int tIdx = threadIdx.x;
    unsigned int gIdx = blockIdx.x * blockDim.x + threadIdx.x;
    extern __shared__ unsigned int s_incScan[];

    if (gIdx >= numVals) return;
    
    // Load input plus offset for first thread in block
    s_incScan[tIdx] = d_inVals[gIdx] + ((tIdx == 0) ? valOffset : 0);
    __syncthreads();

    // Inclusive scan within block, using shared memory
    for (int offset = 1; offset < blockDim.x; offset *= 2)
    {
        unsigned int neighbor = (tIdx >= offset) ? s_incScan[tIdx - offset] : 0;
        __syncthreads(); // Ensure all threads have retrieved their neighbors
        s_incScan[tIdx] += neighbor;
        __syncthreads(); // Ensure all additions complete before next loop
    }

    d_outVals[gIdx] = s_incScan[tIdx];

    // Store block's cumulative sum (last thread's result) in blockOffset array
    if (tIdx == blockDim.x - 1 && blockIdx.x + 1 < gridDim.x)
    {
        d_blockOffset[blockIdx.x + 1] = s_incScan[tIdx];
    }
}
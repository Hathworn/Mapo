#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void incSumScan_kernel(unsigned int* d_outVals, unsigned int* d_inVals, size_t numVals)
{
    unsigned int tIdx = threadIdx.x;
    unsigned int gIdx = blockIdx.x * blockDim.x + threadIdx.x;
    extern __shared__ unsigned int s_incScan[];

    // Return early if global index exceeds number of values
    if (gIdx >= numVals) return;

    s_incScan[tIdx] = (gIdx < numVals) ? d_inVals[gIdx] : 0;
    __syncthreads();

    // Use more efficient loop for shared memory scan
    for (unsigned int offset = 1; offset < blockDim.x; offset *= 2)
    {
        unsigned int temp = 0;
        if (tIdx >= offset)
            temp = s_incScan[tIdx - offset];

        __syncthreads();
        s_incScan[tIdx] += temp;
        __syncthreads();
    }

    // Store result to global output array if within bounds
    if (gIdx < numVals) 
        d_outVals[gIdx] = s_incScan[tIdx];
}
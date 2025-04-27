#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void preScan(unsigned int* deviceInput, unsigned int* deviceOutput, int cnt, unsigned int* deviceSum)
{
    extern __shared__ unsigned int temp[];
    int cntInB = blockDim.x * 2;
    int idxInG = cntInB * blockIdx.x + threadIdx.x;
    int idxInB = threadIdx.x;

    // Initialize shared memory
    temp[2 * idxInB] = (idxInG < cnt) ? deviceInput[idxInG] : 0;
    temp[2 * idxInB + 1] = (idxInG + blockDim.x < cnt) ? deviceInput[idxInG + blockDim.x] : 0;

    int offset = 1;
    for (int d = cntInB >> 1; d > 0; d >>= 1)
    {
        __syncthreads();
        if (threadIdx.x < d)
        {
            int ai = offset * (2 * threadIdx.x + 1) - 1;
            int bi = ai + offset;
            temp[bi] += temp[ai];
        }
        offset *= 2;
    }

    __syncthreads();
    // Move the sum to deviceSums and reset last element in shared memory
    if (threadIdx.x == 0)
    {
        deviceSum[blockIdx.x] = temp[cntInB - 1];
        temp[cntInB - 1] = 0;
    }

    // Downsweep phase
    for (int d = 1; d < cntInB; d *= 2)
    {
        offset >>= 1;
        __syncthreads();
        if (threadIdx.x < d)
        {
            int ai = offset * (2 * threadIdx.x + 1) - 1;
            int bi = ai + offset;
            unsigned int be = temp[bi];
            temp[bi] += temp[ai];
            temp[ai] = be;
        }
    }

    __syncthreads();
    // Write results to device output
    if (idxInG < cnt)
    {
        deviceOutput[idxInG] = temp[2 * idxInB];
    }
    if (idxInG + blockDim.x < cnt)
    {
        deviceOutput[idxInG + blockDim.x] = temp[2 * idxInB + 1];
    }
}
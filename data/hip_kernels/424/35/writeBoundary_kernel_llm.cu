#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void writeBoundary_kernel(int startPos, int rLen, int* d_startArray, int* d_startSumArray, int* d_bounary)
{
    // Use a single dimension for grid and block, simplifying index calculations
    const int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int pos = startPos + tid;

    // Ensure only threads with valid positions execute logic
    if (pos < rLen)
    {
        int flag = d_startArray[pos];
        int writePos = d_startSumArray[pos];
        if (flag == 1)
        {
            d_bounary[writePos] = pos;
        }
    }
}
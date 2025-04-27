#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void writeBoundary_kernel(int startPos, int rLen, int* d_startArray, int* d_startSumArray, int* d_bounary)
{
    // Calculate global thread ID
    int tid = threadIdx.x + blockIdx.x * blockDim.x + (threadIdx.y + blockIdx.y * blockDim.y) * gridDim.x * blockDim.x;
    int pos = startPos + tid;

    // Ensure pos is within range
    if (pos < rLen)
    {
        int flag = d_startArray[pos];
        int writePos = d_startSumArray[pos];
        if (flag == 1)
            d_bounary[writePos] = pos;
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void writeBoundary_kernel(int startPos, int rLen, int* d_startArray, int* d_startSumArray, int* d_bounary)
{
    // Calculate thread and block indices more efficiently
    const int tid = threadIdx.x + threadIdx.y * blockDim.x;
    const int bid = blockIdx.x + blockIdx.y * gridDim.x;
    const int resultID = bid * blockDim.x * blockDim.y + tid; // Combine blockDim.x and blockDim.y
    int pos = startPos + resultID;

    // Process only threads that have valid positions
    if (pos < rLen)
    {
        int flag = d_startArray[pos];
        int writePos = d_startSumArray[pos];
        
        // Conditional store only if flag equals 1
        if (flag == 1)
        {
            d_bounary[writePos] = pos;
        }
    }
}
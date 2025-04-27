#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void writeBoundary_kernel(int startPos, int rLen, int* d_startArray, int* d_startSumArray, int* d_bounary)
{
    // Calculate unique global thread index
    int resultID = blockIdx.x * blockDim.x + threadIdx.x;
    int pos = startPos + resultID;

    // Check if within bounds
    if (pos < rLen)
    {
        int flag = d_startArray[pos]; // Load flag
        int writePos = d_startSumArray[pos]; // Load write position
        if (flag == 1) {
            d_bounary[writePos] = pos; // Write position if flag is 1
        }
    }
}
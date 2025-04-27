#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void writeBoundary_kernel(int startPos, int rLen, int* d_startArray, int* d_startSumArray, int* d_bounary)
{
    // Calculate global thread ID
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int pos = startPos + tid;

    // Ensure thread is within bounds
    if (pos < rLen) {
        int flag = d_startArray[pos];
        int writePos = d_startSumArray[pos];
        // Write boundary conditionally
        if (flag == 1) {
            d_bounary[writePos] = pos;
        }
    }
}
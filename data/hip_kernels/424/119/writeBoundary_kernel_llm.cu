#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void writeBoundary_kernel(int startPos, int rLen, int* d_startArray, int* d_startSumArray, int* d_bounary)
{
    // Calculate the global thread index directly
    const int tid = blockIdx.x * blockDim.x + threadIdx.x;
    const int pos = startPos + tid;
    
    // Ensure thread index does not exceed the range
    if (pos < rLen) {
        int flag = d_startArray[pos];
        int writePos = d_startSumArray[pos];
        
        // Write boundary if the flag condition is met
        if (flag == 1) {
            d_bounary[writePos] = pos;
        }
    }
}
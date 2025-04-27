#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void writeBoundary_kernel(int startPos, int rLen, int* d_startArray, int* d_startSumArray, int* d_bounary)
{
    // Optimize thread index calculation using 1D block and grid indexing
    const int index = blockIdx.x * blockDim.x + threadIdx.x;
    int pos = startPos + index;
    
    if (pos < rLen) {
        int flag = d_startArray[pos];
        int writePos = d_startSumArray[pos];
        if (flag == 1)
            d_bounary[writePos] = pos;
    }
}
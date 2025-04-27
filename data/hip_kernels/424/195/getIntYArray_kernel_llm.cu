#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void getIntYArray_kernel(int2* d_input, int startPos, int rLen, int* d_output)
{
    // Calculate global thread ID
    const int tid = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Calculate position
    int pos = startPos + tid;
    
    // Ensure position is within bounds
    if (pos < rLen)
    {
        int2 value = d_input[pos];
        d_output[pos] = value.y;
    }
}
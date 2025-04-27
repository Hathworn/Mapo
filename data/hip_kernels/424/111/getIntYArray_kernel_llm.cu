#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void getIntYArray_kernel(int2* d_input, int startPos, int rLen, int* d_output)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;  // Calculate global thread index
    int pos = startPos + idx;
    if (pos < rLen)
    {
        d_output[pos] = d_input[pos].y;  // Directly access y-component
    }
}
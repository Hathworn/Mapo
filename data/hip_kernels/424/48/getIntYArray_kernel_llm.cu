#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void getIntYArray_kernel(int2* d_input, int startPos, int rLen, int* d_output)
{
    // Calculate global thread index
    int tid = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x + threadIdx.y * gridDim.x * blockDim.x * blockDim.y;

    int pos = startPos + tid;
    if (pos < rLen)
    {
        int2 value = d_input[pos];
        d_output[pos] = value.y;
    }
}
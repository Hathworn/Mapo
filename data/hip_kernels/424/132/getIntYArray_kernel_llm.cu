#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void getIntYArray_kernel(int2* d_input, int startPos, int rLen, int* d_output)
{
    // Compute unique global thread ID
    int gid = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x + threadIdx.y * gridDim.x * blockDim.y;
    int pos = startPos + gid;

    // Ensure position is within bounds before writing to the output
    if (pos < rLen)
    {
        d_output[pos] = d_input[pos].y;
    }
}
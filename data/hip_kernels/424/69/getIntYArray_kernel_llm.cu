#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void getIntYArray_kernel(int2* d_input, int startPos, int rLen, int* d_output)
{
    // Calculate unique thread ID
    int tid = blockIdx.x * blockDim.x * gridDim.y + blockIdx.y * blockDim.x + threadIdx.x + threadIdx.y * blockDim.x;
    int pos = startPos + tid;

    // Only proceed if within range
    if (pos < rLen)
    {
        d_output[pos] = d_input[pos].y; // Direct access to .y component
    }
}
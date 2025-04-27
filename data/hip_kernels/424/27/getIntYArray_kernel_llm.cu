#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void getIntYArray_kernel(int2* d_input, int startPos, int rLen, int* d_output)
{
    // Calculate unique thread index
    int pos = startPos + blockIdx.x * blockDim.x + threadIdx.x;

    // Check bounds
    if (pos < rLen)
    {
        // Directly access d_input and assign to d_output
        d_output[pos] = d_input[pos].y;
    }
}
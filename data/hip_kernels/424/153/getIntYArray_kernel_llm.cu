#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void getIntYArray_kernel(int2* d_input, int startPos, int rLen, int* d_output)
{
    // Use a 1D block and grid to simplify the index calculation
    int pos = startPos + blockIdx.x * blockDim.x + threadIdx.x;
    
    if(pos < rLen)
    {
        // Fetch and store y component of int2
        d_output[pos] = d_input[pos].y;
    }
}
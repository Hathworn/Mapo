#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void getIntYArray_kernel(int2* d_input, int startPos, int rLen, int* d_output)
{
    const int tid = blockIdx.x * blockDim.x + threadIdx.x; // Compute global thread index directly
    const int pos = startPos + tid; // Calculate position directly with computed index
    if(pos < rLen) // Guard the operation to avoid out-of-bounds access
    {
        int2 value = d_input[pos];
        d_output[pos] = value.y; // Directly store the result 
    }
}
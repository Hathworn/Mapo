#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void getIntYArray_kernel(int2* d_input, int startPos, int rLen, int* d_output)
{
    // Compute a global thread index
    int idx = blockIdx.x * blockDim.x * gridDim.y + blockIdx.y * blockDim.x + threadIdx.x + threadIdx.y * blockDim.x;

    // Calculate position from startPos and index
    int pos = startPos + idx;

    // Ensure position is within range and assign output
    if (pos < rLen)
    {
        d_output[pos] = d_input[pos].y; // Directly access the 'y' field
    }
}
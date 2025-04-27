#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void setBoundaryInt2_kernel(int* d_boundary, int startPos, int numKey, int rLen, int2* d_boundaryRange)
{
    // Calculate thread and block indices using built-in block and thread dimensions
    const int tid = threadIdx.x + blockDim.x * blockIdx.x + blockDim.x * blockIdx.y * gridDim.x;
    const int pos = startPos + tid;

    // Ensure the position is within the number of keys
    if (pos < numKey)
    {
        int2 flag;
        flag.x = d_boundary[pos];
        // Check if pos is not the last, then use next element, otherwise use rLen
        flag.y = (pos + 1 != numKey) ? d_boundary[pos + 1] : rLen;
        d_boundaryRange[pos] = flag;
    }
}
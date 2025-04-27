#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void setBoundaryInt2_kernel(int* d_boundary, int startPos, int numKey, int rLen, int2* d_boundaryRange)
{
    // Calculate global thread index
    int resultID = blockIdx.x * blockDim.x + threadIdx.x;
    int pos = startPos + resultID;

    // Ensure the position is within bounds
    if (pos < numKey)
    {
        int2 flag;
        flag.x = d_boundary[pos];
        flag.y = (pos + 1 != numKey) ? d_boundary[pos + 1] : rLen; // Set boundary or rLen
        d_boundaryRange[pos] = flag;
    }
}
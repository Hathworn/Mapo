#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void setBoundaryInt2_kernel(int* d_boundary, int startPos, int numKey, int rLen, int2* d_boundaryRange)
{
    // Use one-dimensional indexing for blocks
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    // Calculate global position
    int pos = startPos + tid;

    if (pos < numKey)
    {
        int2 flag;
        flag.x = d_boundary[pos];
        // Avoid branching by using conditional operator
        flag.y = (pos + 1 < numKey) ? d_boundary[pos + 1] : rLen;
        d_boundaryRange[pos] = flag;
    }
}
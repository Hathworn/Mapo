#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void setBoundaryInt2_kernel(int* d_boundary, int startPos, int numKey, int rLen, int2* d_boundaryRange)
{
    const int tid = threadIdx.x + threadIdx.y * blockDim.x;
    const int bid = blockIdx.x + blockIdx.y * gridDim.x;

    // Calculate global thread index and position
    const int resultID = bid * blockDim.x + tid;
    int pos = startPos + resultID;

    // Update boundary range only if within bounds
    if (pos < numKey)
    {
        int2 flag;
        flag.x = d_boundary[pos];
        flag.y = (pos + 1 != numKey) ? d_boundary[pos + 1] : rLen;
        d_boundaryRange[pos] = flag;
    }
}
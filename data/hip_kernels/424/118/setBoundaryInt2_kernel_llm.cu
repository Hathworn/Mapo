#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void setBoundaryInt2_kernel(int* d_boundary, int startPos, int numKey, int rLen, int2* d_boundaryRange)
{
    // Optimize thread index calculation
    const int tid = threadIdx.x + threadIdx.y * blockDim.x;
    const int bid = blockIdx.x + blockIdx.y * gridDim.x;
    const int numThread = blockDim.x * blockDim.y;  // Use 2D block size

    const int resultID = bid * numThread + tid;
    int pos = startPos + resultID;

    if (pos < numKey)
    {
        int2 flag;
        flag.x = d_boundary[pos];
        flag.y = (pos + 1 < numKey) ? d_boundary[pos + 1] : rLen;  // Simplify conditional operation
        d_boundaryRange[pos] = flag;
    }
}
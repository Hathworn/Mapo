#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void setBoundaryInt2_kernel(int* d_boundary, int startPos, int numKey, int rLen, int2* d_boundaryRange)
{
    // Use blockDim.x * blockDim.y for more accurate numThreads calculation
    const int tid = threadIdx.x + threadIdx.y * blockDim.x;
    const int bid = blockIdx.x + blockIdx.y * gridDim.x;
    const int numThreads = blockDim.x * blockDim.y;
    const int resultID = bid * numThreads + tid;
    int pos = startPos + resultID;

    if (pos < numKey)
    {
        // Simplify condition inside loop
        int2 flag;
        flag.x = d_boundary[pos];
        flag.y = (pos + 1 != numKey) ? d_boundary[pos + 1] : rLen;
        d_boundaryRange[pos] = flag;
    }
}
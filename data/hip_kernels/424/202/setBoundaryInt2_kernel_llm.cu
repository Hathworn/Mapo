#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void setBoundaryInt2_kernel(int* d_boundary, int startPos, int numKey, int rLen, int2* d_boundaryRange)
{
    // Use blockDim.x * blockDim.y for linear thread ID calculation
    const int bid = blockIdx.x + blockIdx.y * gridDim.x;
    const int tid = threadIdx.x + threadIdx.y * blockDim.x;
    const int numThread = blockDim.x * blockDim.y; // Total threads per block
    const int resultID = bid * numThread + tid;
    int pos = startPos + resultID;

    if(pos < numKey)
    {
        int2 flag;
        flag.x = d_boundary[pos];
        flag.y = (pos + 1 != numKey) ? d_boundary[pos + 1] : rLen; // Use ternary for boundary check
        d_boundaryRange[pos] = flag;
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void setBoundaryInt2_kernel(int* d_boundary, int startPos, int numKey, int rLen, int2* d_boundaryRange)
{
    // Calculate global thread ID
    const int tid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Calculate global position
    int pos = startPos + tid;
    
    // Check if within bounds
    if(pos < numKey)
    {
        int2 flag;
        flag.x = d_boundary[pos];
        
        // Avoid boundary check
        flag.y = (pos + 1 != numKey) ? d_boundary[pos + 1] : rLen;
        
        // Assign to output
        d_boundaryRange[pos] = flag;
    }
}
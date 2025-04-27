#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mergeLocation(const short2* loc_, float* x, float* y, const int npoints, float scale)
{
    // Calculate point index
    const int ptidx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure index is within bounds
    if (ptidx < npoints)
    {
        // Directly access memory with fewer loads
        x[ptidx] = loc_[ptidx].x * scale;
        y[ptidx] = loc_[ptidx].y * scale;
    }
}
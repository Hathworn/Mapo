#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mergeLocation(const short2* loc_, float* x, float* y, const int npoints, float scale)
{
    const int ptidx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure valid index and use register for scale multiplication
    if (ptidx < npoints)
    {
        short2 loc = loc_[ptidx];
        float locX = loc.x * scale;
        float locY = loc.y * scale;

        // Store results in global memory
        x[ptidx] = locX;
        y[ptidx] = locY;
    }
}
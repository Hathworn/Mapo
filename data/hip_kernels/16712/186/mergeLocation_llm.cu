#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mergeLocation(const short2* loc_, float* x, float* y, const int npoints, float scale)
{
    const int ptidx = blockIdx.x * blockDim.x + threadIdx.x;

    if (ptidx < npoints)
    {
        // Load loc from global memory once
        short2 loc = loc_[ptidx];
        
        // Compute scaled values and store directly
        float scaledX = loc.x * scale;
        float scaledY = loc.y * scale;
        x[ptidx] = scaledX;
        y[ptidx] = scaledY;
    }
}
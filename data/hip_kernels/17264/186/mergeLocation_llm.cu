#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mergeLocation(const short2* loc_, float* x, float* y, const int npoints, float scale)
{
    const int ptidx = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (ptidx < npoints)
    {
        // Load loc into registers for faster access
        short2 loc = loc_[ptidx];

        // Pre-compute scaled values for x and y
        float scaledX = loc.x * scale;
        float scaledY = loc.y * scale;

        // Write computed values to global memory
        x[ptidx] = scaledX;
        y[ptidx] = scaledY;
    }
}
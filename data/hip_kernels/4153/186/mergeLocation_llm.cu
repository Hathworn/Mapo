#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mergeLocation(const short2* loc_, float* x, float* y, const int npoints, float scale)
{
    // Acquire the point index for this thread
    const int ptidx = blockIdx.x * blockDim.x + threadIdx.x;

    // Perform computation only if the point index is within bounds
    if (ptidx < npoints)
    {
        // Load data from global memory to register (faster access)
        short2 loc = loc_[ptidx];

        // Perform scaling operations
        x[ptidx] = loc.x * scale;
        y[ptidx] = loc.y * scale;
    }
}
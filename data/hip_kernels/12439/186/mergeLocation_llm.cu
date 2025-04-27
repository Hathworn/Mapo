#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mergeLocation(const short2* loc_, float* x, float* y, const int npoints, float scale)
{
    // Calculate unique thread index
    const int ptidx = blockIdx.x * blockDim.x + threadIdx.x;

    // Process only valid points
    if (ptidx < npoints)
    {
        // Read the input location
        short2 loc = loc_[ptidx];

        // Perform scaling
        x[ptidx] = loc.x * scale;
        y[ptidx] = loc.y * scale;
    }
}
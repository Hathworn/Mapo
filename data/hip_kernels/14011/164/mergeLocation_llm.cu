#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void mergeLocation(const short2* loc_, float* x, float* y, const int npoints, float scale)
{
    // Compute point index
    const int ptidx = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if point index is in range
    if (ptidx < npoints)
    {
        // Use register variables for temporary storage
        short2 loc = loc_[ptidx];

        // Store scaled location
        x[ptidx] = loc.x * scale;
        y[ptidx] = loc.y * scale;
    }
}
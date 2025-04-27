#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mergeLocation(const short2* loc_, float* x, float* y, const int npoints, float scale)
{
    // Calculate point index for this thread
    const int ptidx = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if the point index is within bounds
    if (ptidx < npoints)
    {
        // Load location data from global memory into a register
        short2 loc = __ldg(&loc_[ptidx]);

        // Perform the scaling and store results in global memory
        x[ptidx] = loc.x * scale;
        y[ptidx] = loc.y * scale;
    }
}
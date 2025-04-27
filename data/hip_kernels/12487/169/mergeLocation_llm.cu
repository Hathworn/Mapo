#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mergeLocation(const short2* loc_, float* x, float* y, const int npoints, float scale)
{
    const int ptidx = blockIdx.x * blockDim.x + threadIdx.x;

    // Optimize by applying loop unrolling to minimize loop overhead
    if (ptidx < npoints)
    {
        short2 loc = loc_[ptidx];
        x[ptidx] = loc.x * scale;
        y[ptidx] = loc.y * scale;

        // Unrolling may occur when there are more points per thread
        if (ptidx + blockDim.x < npoints)
        {
            loc = loc_[ptidx + blockDim.x];
            x[ptidx + blockDim.x] = loc.x * scale;
            y[ptidx + blockDim.x] = loc.y * scale;
        }
    }
}
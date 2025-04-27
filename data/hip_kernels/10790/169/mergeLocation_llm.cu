#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mergeLocation(const short2* loc_, float* x, float* y, const int npoints, float scale)
{
    const int ptidx = blockIdx.x * blockDim.x + threadIdx.x;

    if (ptidx < npoints)
    {
        // Use registers to avoid redundant memory access
        const short2 loc = loc_[ptidx];

        x[ptidx] = loc.x * scale;
        y[ptidx] = loc.y * scale;
    }
}
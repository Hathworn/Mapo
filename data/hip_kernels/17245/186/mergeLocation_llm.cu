#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mergeLocation(const short2* loc_, float* x, float* y, const int npoints, float scale)
{
    const int ptidx = blockIdx.x * blockDim.x + threadIdx.x;

    if (ptidx < npoints)
    {
        // Load loc_ into registers to reduce global memory access
        short2 loc = __ldg(&loc_[ptidx]);

        // Compute scaled x and y values
        x[ptidx] = loc.x * scale;
        y[ptidx] = loc.y * scale;
    }
}
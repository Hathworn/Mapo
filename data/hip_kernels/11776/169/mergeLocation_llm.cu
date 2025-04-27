#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mergeLocation(const short2* loc_, float* x, float* y, const int npoints, float scale)
{
    const int ptidx = blockIdx.x * blockDim.x + threadIdx.x;

    if (ptidx < npoints)
    {
        short2 loc = loc_[ptidx];

        // Apply scale directly without temporary variables for efficiency
        x[ptidx] = __int2float_rn(loc.x) * scale;
        y[ptidx] = __int2float_rn(loc.y) * scale;
    }
}
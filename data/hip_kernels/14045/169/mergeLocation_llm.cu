#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mergeLocation(const short2* loc_, float* x, float* y, const int npoints, float scale)
{
    const int ptidx = blockIdx.x * blockDim.x + threadIdx.x;

    if (ptidx < npoints)
    {
        // Fetch location to a register for faster access
        short2 loc = loc_[ptidx];

        // Perform computation and directly store in global memory
        float2 scaled_loc = make_float2(loc.x * scale, loc.y * scale);

        x[ptidx] = scaled_loc.x;
        y[ptidx] = scaled_loc.y;
    }
}
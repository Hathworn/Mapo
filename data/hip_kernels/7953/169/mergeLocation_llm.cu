#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mergeLocation(const short2* loc_, float* x, float* y, const int npoints, float scale)
{
    const int ptidx = blockIdx.x * blockDim.x + threadIdx.x;

    if (ptidx < npoints)
    {
        short2 loc = loc_[ptidx];

        // Use local variables to reduce memory access
        float scaled_x = loc.x * scale;
        float scaled_y = loc.y * scale;

        x[ptidx] = scaled_x;
        y[ptidx] = scaled_y;
    }
}
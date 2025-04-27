#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mergeLocation(const short2* loc_, float* x, float* y, const int npoints, float scale)
{
    const int ptidx = blockIdx.x * blockDim.x + threadIdx.x;

    if (ptidx < npoints)
    {
        // Use register variables for faster access
        const short2 loc = loc_[ptidx];
        const float scaled_x = loc.x * scale;
        const float scaled_y = loc.y * scale;

        // Write results to global memory
        x[ptidx] = scaled_x;
        y[ptidx] = scaled_y;
    }
}
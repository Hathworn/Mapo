#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mergeLocation(const short2* loc_, float* x, float* y, const int npoints, float scale)
{
    const int ptidx = blockIdx.x * blockDim.x + threadIdx.x;

    if (ptidx < npoints)
    {
        short2 loc = loc_[ptidx];

        // Combine memory load operations to improve coalescing
        const float loc_x = loc.x * scale;
        const float loc_y = loc.y * scale;

        // Write results back to global memory
        x[ptidx] = loc_x;
        y[ptidx] = loc_y;
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mergeLocation(const short2* loc_, float* x, float* y, const int npoints, float scale)
{
    // Calculate global thread index
    const int ptidx = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if thread index is within range
    if (ptidx < npoints)
    {
        // Enhanced memory access and computation handling
        short2 loc = loc_[ptidx];
        float scaled_x = loc.x * scale;
        float scaled_y = loc.y * scale;

        // Prevent redundant computations and improve memory coalescing
        x[ptidx] = scaled_x;
        y[ptidx] = scaled_y;
    }
}
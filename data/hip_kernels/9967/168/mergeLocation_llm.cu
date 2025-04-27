#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mergeLocation(const short2* loc_, float* x, float* y, const int npoints, float scale)
{
    // Calculate thread index for each point
    const int ptidx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure thread index is within valid range
    if (ptidx < npoints)
    {
        short2 loc = loc_[ptidx];

        // Use efficient memory fetch
        float scaled_x = __half2float(loc.x) * scale;
        float scaled_y = __half2float(loc.y) * scale;

        // Write results back to global memory
        x[ptidx] = scaled_x;
        y[ptidx] = scaled_y;
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mergeLocation(const short2* loc_, float* x, float* y, const int npoints, float scale)
{
    const int ptidx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure thread execution only if within bounds
    if (ptidx < npoints)
    {
        short2 loc = loc_[ptidx];

        // Load, compute and store efficiently
        float scaled_x = __fmul_rn(loc.x, scale);
        float scaled_y = __fmul_rn(loc.y, scale);
        
        x[ptidx] = scaled_x;
        y[ptidx] = scaled_y;
    }
}
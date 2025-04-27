#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mergeLocation(const short2* loc_, float* x, float* y, const int npoints, float scale)
{
    const int ptidx = blockIdx.x * blockDim.x + threadIdx.x;

    // Use loop unrolling for improved performance
    for (int idx = ptidx; idx < npoints; idx += blockDim.x * gridDim.x) 
    {
        short2 loc = loc_[idx];
        x[idx] = loc.x * scale;
        y[idx] = loc.y * scale;
    }
}
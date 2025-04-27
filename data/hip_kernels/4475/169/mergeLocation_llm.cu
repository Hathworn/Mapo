#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mergeLocation(const short2* loc_, float* x, float* y, const int npoints, float scale)
{
    const int ptidx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure thread index is within bounds
    if (ptidx >= npoints) return;

    // Use local variables to reduce memory access latency
    short2 loc = loc_[ptidx];
    float locx = loc.x * scale;
    float locy = loc.y * scale;
    
    x[ptidx] = locx;
    y[ptidx] = locy;
}
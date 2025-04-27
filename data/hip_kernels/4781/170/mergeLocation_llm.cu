#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mergeLocation(const short2* loc_, float* x, float* y, const int npoints, float scale)
{
    const int ptidx = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if index is within bounds
    if (ptidx >= npoints) return;

    short2 loc = loc_[ptidx];

    // Applying scale to x and y coordinates
    x[ptidx] = loc.x * scale;
    y[ptidx] = loc.y * scale;
}
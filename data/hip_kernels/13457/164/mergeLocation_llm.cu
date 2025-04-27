#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mergeLocation(const short2* __restrict__ loc_, float* __restrict__ x, float* __restrict__ y, const int npoints, float scale)
{
    const int ptidx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure that we do not access out-of-bounds memory
    if (ptidx >= npoints) return;

    short2 loc = loc_[ptidx];

    // Minimize memory latency by using temporary variables
    float loc_x = loc.x * scale;
    float loc_y = loc.y * scale;

    x[ptidx] = loc_x;
    y[ptidx] = loc_y;
}
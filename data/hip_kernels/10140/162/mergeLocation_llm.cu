#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mergeLocation(const short2* __restrict__ loc_, float* __restrict__ x, float* __restrict__ y, const int npoints, float scale)
{
    const int ptidx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure thread index is within bounds
    if (ptidx < npoints)
    {
        short2 loc = loc_[ptidx];

        // Perform scaled assignment
        x[ptidx] = loc.x * scale;
        y[ptidx] = loc.y * scale;
    }
}
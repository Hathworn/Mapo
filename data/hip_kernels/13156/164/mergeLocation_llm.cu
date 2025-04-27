#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mergeLocation(const short2* __restrict__ loc_, float* __restrict__ x, float* __restrict__ y, const int npoints, const float scale)
{
    // Use a more efficient method for parallel execution
    int ptidx = blockIdx.x * blockDim.x + threadIdx.x;

    if (ptidx < npoints)
    {
        // Use register memory for temporary variables
        const short2 loc = loc_[ptidx];

        x[ptidx] = loc.x * scale;
        y[ptidx] = loc.y * scale;
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mergeLocation(const short2* __restrict__ loc_, float* __restrict__ x, float* __restrict__ y, const int npoints, float scale)
{
    // Calculate point index using blockDim, blockIdx, and threadIdx
    const int ptidx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure that we operate only within bounds
    if (ptidx < npoints)
    {
        // Fetch loc value from global memory once
        short2 loc = loc_[ptidx];

        // Perform computations and store results in the global memory
        x[ptidx] = __fmul_rn(loc.x, scale); // Use fast multiply intrinsic
        y[ptidx] = __fmul_rn(loc.y, scale); // Use fast multiply intrinsic
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void mergeLocation(const short2* __restrict__ loc_, float* __restrict__ x, float* __restrict__ y, const int npoints, float scale)
{
    const int ptidx = blockIdx.x * blockDim.x + threadIdx.x;
    if (ptidx < npoints)
    {
        // Load loc value into a register for better performance
        short2 loc = loc_[ptidx];
        // Perform scaling and store results in output arrays
        x[ptidx] = loc.x * scale;
        y[ptidx] = loc.y * scale;
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mergeLocation(const short2* loc_, float* x, float* y, const int npoints, float scale)
{
    // Calculate global thread index
    const int ptidx = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if within bounds and perform calculations
    if (ptidx < npoints)
    {
        // Load short2 element into registers
        short2 loc = loc_[ptidx];

        // Use FMA to directly calculate and store scaled values
        x[ptidx] = __fmul_rd(loc.x, scale);
        y[ptidx] = __fmul_rd(loc.y, scale);
    }
}
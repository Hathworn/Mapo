#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mergeLocation(const short2* loc_, float* x, float* y, const int npoints, float scale)
{
    // Calculate thread index more efficiently
    int ptidx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure index is within bounds
    if (ptidx < npoints)
    {
        // Load data into registers for efficient access
        short2 loc = loc_[ptidx];

        // Perform scaled assignment directly
        x[ptidx] = __fmul_rn(loc.x, scale);
        y[ptidx] = __fmul_rn(loc.y, scale);
    }
}
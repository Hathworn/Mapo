#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mergeLocation(const short2* loc_, float* x, float* y, const int npoints, float scale)
{
    const int ptidx = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory for coalesced memory access pattern if applicable
    if (ptidx < npoints)
    {
        // Load loc_ data into registers to reduce global memory access
        short2 loc = loc_[ptidx];

        // Direct computation without storing intermediate results
        x[ptidx] = loc.x * scale;
        y[ptidx] = loc.y * scale;
    }
}
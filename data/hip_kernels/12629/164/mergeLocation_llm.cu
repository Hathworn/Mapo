#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mergeLocation(const short2* loc_, float* x, float* y, const int npoints, float scale)
{
    // Calculate global thread index
    const int ptidx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure thread is within bounds
    if (ptidx < npoints)
    {
        const short2 loc = loc_[ptidx]; // Load data to a register

        // Perform scaling
        x[ptidx] = loc.x * scale;
        y[ptidx] = loc.y * scale;
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void mergeLocation(const short2* loc_, float* x, float* y, const int npoints, float scale)
{
    // Calculate global thread ID
    const int ptidx = blockIdx.x * blockDim.x + threadIdx.x;

    // Check bounds
    if (ptidx < npoints)
    {
        // Use registers for local variables
        short2 loc = loc_[ptidx];

        // Perform scaled assignment
        x[ptidx] = loc.x * scale;
        y[ptidx] = loc.y * scale;
    }
}
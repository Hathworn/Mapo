#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mergeLocation(const short2* loc_, float* x, float* y, const int npoints, float scale)
{
    const int ptidx = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if index is within bounds before accessing memory
    if (ptidx < npoints)
    {
        short2 loc = loc_[ptidx];

        // Use shared memory for scale multiplication if multiple threads need the same value
        x[ptidx] = loc.x * scale;
        y[ptidx] = loc.y * scale;
    }
}
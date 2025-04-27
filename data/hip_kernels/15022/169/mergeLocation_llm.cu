#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mergeLocation(const short2* loc_, float* x, float* y, const int npoints, float scale)
{
    // Calculate overall thread index
    const int ptidx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure thread is within bounds
    if (ptidx < npoints)
    {
        short2 loc = loc_[ptidx];
        // Use registers to store scaled x and y values
        float scaledX = loc.x * scale;
        float scaledY = loc.y * scale;

        // Assign scaled values to the output arrays
        x[ptidx] = scaledX;
        y[ptidx] = scaledY;
    }
}
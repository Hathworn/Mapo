#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void mergeLocation(const short2* loc_, float* x, float* y, const int npoints, float scale)
{
    const int ptidx = blockIdx.x * blockDim.x + threadIdx.x;

    if (ptidx < npoints)
    {
        short2 loc = loc_[ptidx];
        float scaledX = loc.x * scale; // Precalculate scaled x
        float scaledY = loc.y * scale; // Precalculate scaled y

        x[ptidx] = scaledX; // Assign scaled values
        y[ptidx] = scaledY;
    }
}
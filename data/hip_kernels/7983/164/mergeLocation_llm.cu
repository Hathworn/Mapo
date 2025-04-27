#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mergeLocation(const short2* loc_, float* x, float* y, const int npoints, float scale)
{
    const int ptidx = blockIdx.x * blockDim.x + threadIdx.x;

    if (ptidx < npoints)
    {
        // Utilize registers to reduce memory accesses
        short2 loc = loc_[ptidx];
        float x_val = loc.x * scale;
        float y_val = loc.y * scale;

        // Write results back to global memory
        x[ptidx] = x_val;
        y[ptidx] = y_val;
    }
}
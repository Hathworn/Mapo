#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mergeLocation(const short2* loc_, float* x, float* y, const int npoints, float scale)
{
    // Calculate global thread index and check boundary in a single step.
    int ptidx;
    if ((ptidx = blockIdx.x * blockDim.x + threadIdx.x) < npoints) 
    {
        // Use registers for temporary values to optimize memory access.
        short2 loc = loc_[ptidx];
        x[ptidx] = loc.x * scale;
        y[ptidx] = loc.y * scale;
    }
}
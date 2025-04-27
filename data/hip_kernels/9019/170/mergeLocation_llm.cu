#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mergeLocation(const short2* loc_, float* x, float* y, const int npoints, float scale)
{
    // Calculate index with fewer registers
    const int ptidx = blockIdx.x * blockDim.x + threadIdx.x;

    // Use branch-less condition with ternary operator
    if (ptidx < npoints)
    {
        // Load data from global memory once, optimization with register reuse
        short2 loc = loc_[ptidx];
        
        // Optimize memory accesses by coalescing
        x[ptidx] = loc.x * scale;
        y[ptidx] = loc.y * scale;
    }
}
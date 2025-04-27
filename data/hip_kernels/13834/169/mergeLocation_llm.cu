#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mergeLocation(const short2* loc_, float* x, float* y, const int npoints, float scale)
{
    const int ptidx = blockIdx.x * blockDim.x + threadIdx.x;

    // Use a single conditional check to reduce divergence.
    if (ptidx >= npoints) return;
    
    // Load data into registers for better memory access efficiency.
    short2 loc = loc_[ptidx];

    // Perform computation using registers.
    x[ptidx] = loc.x * scale;
    y[ptidx] = loc.y * scale;
}
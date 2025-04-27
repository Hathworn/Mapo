#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mergeLocation(const short2* loc_, float* x, float* y, const int npoints, float scale)
{
    // Calculate global thread index
    const int ptidx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure the index does not exceed the number of elements
    if (ptidx >= npoints) return;

    // Load the location data
    short2 loc = loc_[ptidx];

    // Perform the scaled assignment
    x[ptidx] = loc.x * scale;
    y[ptidx] = loc.y * scale;
}
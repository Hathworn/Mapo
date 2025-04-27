#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void mergeLocation(const short2* loc_, float* x, float* y, const int npoints, float scale)
{
    const int ptidx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use if statement with common repeat code to reduce branching 
    if (ptidx >= npoints) return;

    // Fetch loc once to reduce memory access time
    short2 loc = loc_[ptidx];

    // Use variables to avoid repeated index calculations
    float scaledX = loc.x * scale;
    float scaledY = loc.y * scale;
    
    x[ptidx] = scaledX;
    y[ptidx] = scaledY;
}
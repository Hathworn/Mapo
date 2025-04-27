#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mergeLocation(const short2* loc_, float* x, float* y, const int npoints, float scale)
{
    // Calculate the unique thread index
    int ptidx = blockIdx.x * blockDim.x + threadIdx.x;
   
    // Use a loop to process multiple points per thread to maximize warp efficiency
    for (; ptidx < npoints; ptidx += blockDim.x * gridDim.x)
    {
        short2 loc = loc_[ptidx];
        
        // Perform scaled assignment
        x[ptidx] = loc.x * scale;
        y[ptidx] = loc.y * scale;
    }
}
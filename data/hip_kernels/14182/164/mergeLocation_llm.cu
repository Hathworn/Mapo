#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mergeLocation(const short2* loc_, float* x, float* y, const int npoints, float scale)
{
    // Calculate the point index for the current thread
    int ptidx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use stride loop for better utilization of GPU resources
    while (ptidx < npoints) 
    {
        short2 loc = loc_[ptidx];

        // Apply scale transformation
        x[ptidx] = loc.x * scale;
        y[ptidx] = loc.y * scale;
        
        // Increment by total number of threads in grid
        ptidx += blockDim.x * gridDim.x;
    }
}
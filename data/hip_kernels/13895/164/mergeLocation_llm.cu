#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mergeLocation(const short2* loc_, float* x, float* y, const int npoints, float scale)
{
    const int ptidx = blockIdx.x * blockDim.x + threadIdx.x;

    if (ptidx < npoints)
    {
        // Load loc_ into registers only once
        short2 loc = __ldg(&loc_[ptidx]); 

        // Use float variables for calculations to avoid redundant conversions
        float x_scaled = loc.x * scale; 
        float y_scaled = loc.y * scale; 
        
        // Store results
        x[ptidx] = x_scaled;
        y[ptidx] = y_scaled;
    }
}
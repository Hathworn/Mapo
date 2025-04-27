#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mergeLocation(const short2* loc_, float* x, float* y, const int npoints, float scale)
{
    const int ptidx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure valid index and process in bounds
    if (ptidx < npoints)
    {
        short2 loc = loc_[ptidx];
        float scaled_x = loc.x * scale;
        float scaled_y = loc.y * scale;
        
        // Coalesced memory writes
        x[ptidx] = scaled_x;
        y[ptidx] = scaled_y;
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mergeLocation(const short2* loc_, float* x, float* y, const int npoints, float scale)
{
    // Calculate unique thread index
    const int ptidx = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if within bounds using a simple conditional
    if (ptidx < npoints)
    {
        short2 loc = loc_[ptidx];
        
        // Use register to store scaled values before writing to memory for efficiency
        float scaled_x = loc.x * scale;
        float scaled_y = loc.y * scale;

        x[ptidx] = scaled_x;
        y[ptidx] = scaled_y;
    }
}
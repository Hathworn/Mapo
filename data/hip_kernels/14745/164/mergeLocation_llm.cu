#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mergeLocation(const short2* loc_, float* x, float* y, const int npoints, float scale)
{
    const int ptidx = blockIdx.x * blockDim.x + threadIdx.x;

    if (ptidx < npoints)
    {
        // Load the location data once into local memory to reduce global memory access
        short2 loc = __ldg(&loc_[ptidx]);

        // Avoid re-computation by storing scaled values in registers
        float scaled_x = loc.x * scale;
        float scaled_y = loc.y * scale;
        
        // Store the results back to global memory
        x[ptidx] = scaled_x;
        y[ptidx] = scaled_y;
    }
}
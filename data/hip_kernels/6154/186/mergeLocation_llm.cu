#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mergeLocation(const short2* loc_, float* x, float* y, const int npoints, float scale)
{
    const int ptidx = blockIdx.x * blockDim.x + threadIdx.x;

    if (ptidx < npoints)
    {
        // Load loc into register to reduce global memory access
        short2 loc = loc_[ptidx];

        // Perform scaled assignment
        float scaled_x = loc.x * scale;
        float scaled_y = loc.y * scale;

        // Write back results to global memory 
        x[ptidx] = scaled_x;
        y[ptidx] = scaled_y;
    }
}
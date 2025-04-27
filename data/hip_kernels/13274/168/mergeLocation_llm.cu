#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mergeLocation(const short2* loc_, float* x, float* y, const int npoints, float scale)
{
    const int ptidx = blockIdx.x * blockDim.x + threadIdx.x;

    // Unroll condition to avoid warp divergence
    if (ptidx >= npoints) return;
    
    short2 loc = loc_[ptidx];

    // Utilize registers for calculations
    float scaled_x = loc.x * scale;
    float scaled_y = loc.y * scale;
    
    // Write results back to global memory
    x[ptidx] = scaled_x;
    y[ptidx] = scaled_y;
}
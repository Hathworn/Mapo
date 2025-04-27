#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mergeLocation(const short2* loc_, float* x, float* y, const int npoints, float scale)
{
    // Use a stride loop for better memory coalescing and efficient utilization of GPU threads
    for (int ptidx = blockIdx.x * blockDim.x + threadIdx.x; ptidx < npoints; ptidx += blockDim.x * gridDim.x)
    {
        short2 loc = loc_[ptidx];
        x[ptidx] = loc.x * scale;
        y[ptidx] = loc.y * scale;
    }
}
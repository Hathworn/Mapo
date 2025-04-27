#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mergeLocation(const short2* loc_, float* x, float* y, const int npoints, float scale)
{
    // Calculate element index with grid size to improve scalability
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    
    // Loop through all points with stride to use more threads efficiently
    for (int ptidx = idx; ptidx < npoints; ptidx += stride)
    {
        short2 loc = loc_[ptidx];
        x[ptidx] = loc.x * scale;
        y[ptidx] = loc.y * scale;
    }
}
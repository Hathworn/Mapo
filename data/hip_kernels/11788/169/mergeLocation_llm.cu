#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mergeLocation(const short2* loc_, float* x, float* y, const int npoints, float scale)
{
    // Calculate global thread index based on grid and block dimensions
    int ptidx = blockIdx.x * blockDim.x + threadIdx.x;

    // Use stride variable for loop, allowing more threads beyond grid size to process if needed
    int stride = gridDim.x * blockDim.x; 

    // Loop through points with stride to cover entire data array if needed
    for (; ptidx < npoints; ptidx += stride) {
        short2 loc = loc_[ptidx];
        x[ptidx] = loc.x * scale;
        y[ptidx] = loc.y * scale;
    }
}
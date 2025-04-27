#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void mergeLocation(const short2* loc_, float* x, float* y, const int npoints, float scale)
{
    // Use a single int to represent the global thread index
    int ptidx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Compare once, store in temporary variable for further use
    if (ptidx < npoints) {
        // Load local memory only once for each value
        short lx = loc_[ptidx].x;
        short ly = loc_[ptidx].y;
        
        // Perform calculations and store directly in result arrays
        x[ptidx] = lx * scale;
        y[ptidx] = ly * scale;
    }
}
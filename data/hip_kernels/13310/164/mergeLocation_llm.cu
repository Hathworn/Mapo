#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mergeLocation(const short2* loc_, float* x, float* y, const int npoints, float scale)
{
    // Calculate global thread index once
    const int ptidx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure processing only for valid points
    if (ptidx < npoints)
    {
        // Read loc_ into local memory only once
        short2 loc = loc_[ptidx];

        // Utilize registers for scaled values to avoid repeated multiplication
        float scaledX = loc.x * scale;
        float scaledY = loc.y * scale;
        
        // Store the results directly
        x[ptidx] = scaledX;
        y[ptidx] = scaledY;
    }
}
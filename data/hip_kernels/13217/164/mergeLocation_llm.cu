#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mergeLocation(const short2* loc_, float* x, float* y, const int npoints, float scale)
{
    // Calculate global index for the thread
    const int ptidx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure the thread operates only on valid data points
    if (ptidx < npoints)
    {
        // Use register storage for the local variable to optimize memory usage
        register short2 loc = loc_[ptidx];

        // Multiply once and store in separate arrays
        float mul_scale = loc.x * scale;
        x[ptidx] = mul_scale;

        mul_scale = loc.y * scale;
        y[ptidx] = mul_scale;
    }
}
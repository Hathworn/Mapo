#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void mergeLocation(const short2* loc_, float* x, float* y, const int npoints, float scale)
{
    // Calculate global thread index
    const int ptidx = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory to reduce global memory access
    if (ptidx < npoints)
    {
        short2 loc = loc_[ptidx];
        float scaledX = loc.x * scale;
        float scaledY = loc.y * scale;

        __syncthreads(); // Ensure all threads have completed computation before writing back

        x[ptidx] = scaledX;
        y[ptidx] = scaledY;
    }
}
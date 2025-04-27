#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mergeLocation(const short2* loc_, float* x, float* y, const int npoints, float scale)
{
    // Calculate global thread index
    const int ptidx = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory for scaling factor reuse
    __shared__ float shared_scale;

    // Load scale factor into shared memory once
    if (threadIdx.x == 0)
    {
        shared_scale = scale;
    }
    __syncthreads();

    // Perform computation only if within bounds
    if (ptidx < npoints)
    {
        short2 loc = loc_[ptidx];

        // Utilize shared memory scale factor
        x[ptidx] = loc.x * shared_scale;
        y[ptidx] = loc.y * shared_scale;
    }
}
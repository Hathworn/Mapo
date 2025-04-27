#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mergeLocation(const short2* loc_, float* x, float* y, const int npoints, float scale)
{
    // Calculate point index
    const int ptidx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure index is within bounds
    if (ptidx < npoints)
    {
        // Load loc data into shared memory to optimize access
        __shared__ short2 shared_loc[256]; // Assuming max blockDim.x is 256
        shared_loc[threadIdx.x] = loc_[ptidx];
        __syncthreads();

        short2 loc = shared_loc[threadIdx.x];

        // Perform scaling and write to output
        x[ptidx] = loc.x * scale;
        y[ptidx] = loc.y * scale;
    }
}
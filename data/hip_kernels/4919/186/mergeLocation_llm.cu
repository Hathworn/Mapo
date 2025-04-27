#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mergeLocation(const short2* loc_, float* x, float* y, const int npoints, float scale)
{
    // Use shared memory for improved memory access efficiency
    __shared__ short2 sharedLoc[256]; // Adjust size based on blockDim.x

    const int ptidx = blockIdx.x * blockDim.x + threadIdx.x;

    if (ptidx < npoints)
    {
        // Load data into shared memory
        sharedLoc[threadIdx.x] = loc_[ptidx];
        __syncthreads();

        // Use cached shared data
        x[ptidx] = sharedLoc[threadIdx.x].x * scale;
        y[ptidx] = sharedLoc[threadIdx.x].y * scale;
    }
}
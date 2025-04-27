#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mergeLocation(const short2* loc_, float* x, float* y, const int npoints, float scale)
{
    // Utilize shared memory for faster access
    extern __shared__ short2 sharedLoc[];
    const int ptidx = blockIdx.x * blockDim.x + threadIdx.x;

    if (ptidx < npoints)
    {
        // Load data into shared memory
        sharedLoc[threadIdx.x] = loc_[ptidx];
        __syncthreads();

        // Use shared memory values
        x[ptidx] = sharedLoc[threadIdx.x].x * scale;
        y[ptidx] = sharedLoc[threadIdx.x].y * scale;
    }
}
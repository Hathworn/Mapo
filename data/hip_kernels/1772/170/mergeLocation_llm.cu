#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mergeLocation(const short2* loc_, float* x, float* y, const int npoints, float scale)
{
    const int ptidx = blockIdx.x * blockDim.x + threadIdx.x;

    if (ptidx < npoints)
    {
        short2 loc = loc_[ptidx];

        // Use shared memory to reduce global memory access (if beneficial)
        __shared__ short2 sharedLoc[256]; // assuming blockDim.x <= 256
        sharedLoc[threadIdx.x] = loc;
        __syncthreads();

        // Scale and write back results using shared memory
        x[ptidx] = sharedLoc[threadIdx.x].x * scale;
        y[ptidx] = sharedLoc[threadIdx.x].y * scale;
    }
}
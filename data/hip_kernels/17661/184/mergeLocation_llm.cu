#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void mergeLocation(const short2* loc_, float* x, float* y, const int npoints, float scale)
{
    // Use the shared memory to reduce global memory accesses
    extern __shared__ short2 shared_loc[];

    const int ptidx = blockIdx.x * blockDim.x + threadIdx.x;

    if (ptidx < npoints)
    {
        // Load data into shared memory to coalesce global memory access
        shared_loc[threadIdx.x] = loc_[ptidx];
        __syncthreads();

        short2 loc = shared_loc[threadIdx.x];

        x[ptidx] = loc.x * scale;
        y[ptidx] = loc.y * scale;
    }
}
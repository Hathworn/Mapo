#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mergeLocation(const short2* loc_, float* x, float* y, const int npoints, float scale)
{
    // Use a shared memory buffer to reduce memory latency
    extern __shared__ short2 shared_loc[];
    
    const int ptidx = blockIdx.x * blockDim.x + threadIdx.x;

    if (ptidx < npoints)
    {
        // Load data into shared memory
        shared_loc[threadIdx.x] = loc_[ptidx];
        __syncthreads();

        // Perform computations using shared memory
        short2 loc = shared_loc[threadIdx.x];
        x[ptidx] = loc.x * scale;
        y[ptidx] = loc.y * scale;
    }
}
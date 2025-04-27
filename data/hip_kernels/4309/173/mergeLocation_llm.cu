#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mergeLocation(const short2* loc_, float* x, float* y, const int npoints, float scale)
{
    // Calculate point index
    const int ptidx = blockIdx.x * blockDim.x + threadIdx.x;

    // Utilize shared memory to reduce global memory accesses
    __shared__ short2 shared_loc[256]; // Assuming blockDim.x <= 256

    if (ptidx < npoints)
    {
        // Load data into shared memory
        shared_loc[threadIdx.x] = loc_[ptidx];
        __syncthreads(); // Ensure all threads have loaded their data

        // Perform computation using shared memory
        short2 loc = shared_loc[threadIdx.x];
        x[ptidx] = loc.x * scale;
        y[ptidx] = loc.y * scale;
    }
}
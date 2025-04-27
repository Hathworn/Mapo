#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mergeLocation(const short2* loc_, float* x, float* y, const int npoints, float scale)
{
    // Calculate the index using block and thread identifiers
    const int ptidx = blockIdx.x * blockDim.x + threadIdx.x;

    if (ptidx < npoints)
    {
        // Use shared memory for improved memory access efficiency
        __shared__ short2 shared_loc[256];  // Adjust size as needed

        // Load location into shared memory
        shared_loc[threadIdx.x] = loc_[ptidx];
        __syncthreads();

        // Read from shared memory
        x[ptidx] = shared_loc[threadIdx.x].x * scale;
        y[ptidx] = shared_loc[threadIdx.x].y * scale;
    }
}
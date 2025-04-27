#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mergeLocation(const short2* loc_, float* x, float* y, const int npoints, float scale)
{
    // Use shared memory for coalesced access if beneficial
    __shared__ short2 shared_loc[256]; // Adjust size based on blockDim.x and occupancy 

    const int ptidx = blockIdx.x * blockDim.x + threadIdx.x;

    if (ptidx < npoints)
    {
        shared_loc[threadIdx.x] = loc_[ptidx]; // Load from global to shared memory
        __syncthreads(); // Ensure all threads have loaded the data

        const short2 loc = shared_loc[threadIdx.x]; // Access shared memory
        x[ptidx] = loc.x * scale;
        y[ptidx] = loc.y * scale;
    }
}
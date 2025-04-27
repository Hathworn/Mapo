#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mergeLocation(const short2* loc_, float* x, float* y, const int npoints, float scale)
{
    // Calculate global thread index
    const int ptidx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use shared memory to load data for coalesced access
    __shared__ short2 sharedLoc[256];  // This example assumes max 256 threads per block
    if (ptidx < npoints) {
        sharedLoc[threadIdx.x] = loc_[ptidx];

        __syncthreads();  // Synchronize threads to ensure shared memory is loaded

        x[ptidx] = sharedLoc[threadIdx.x].x * scale;
        y[ptidx] = sharedLoc[threadIdx.x].y * scale;
    }
}
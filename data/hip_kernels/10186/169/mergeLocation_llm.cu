#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mergeLocation(const short2* loc_, float* x, float* y, const int npoints, float scale)
{
    const int ptidx = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if index within bounds before doing any computation
    if (ptidx < npoints)
    {
        short2 loc = loc_[ptidx];

        // Utilize shared memory for intermediate storage to avoid repeated global memory access
        __shared__ float shared_x[256];  // Assuming blockDim.x = 256, adjust according to actual block size
        __shared__ float shared_y[256];
        
        // Perform calculations and store in shared memory
        shared_x[threadIdx.x] = loc.x * scale;
        shared_y[threadIdx.x] = loc.y * scale;
        
        // Sync threads to ensure shared memory is populated
        __syncthreads();
        
        // Write back to global memory from shared memory
        x[ptidx] = shared_x[threadIdx.x];
        y[ptidx] = shared_y[threadIdx.x];
    }
}
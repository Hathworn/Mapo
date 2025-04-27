#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mergeLocation(const short2* loc_, float* x, float* y, const int npoints, float scale)
{
    // Calculate global thread index
    int ptidx = blockIdx.x * blockDim.x + threadIdx.x;

    // Utilize shared memory for efficient data loading
    __shared__ short2 shared_loc[256];
    
    if (ptidx < npoints)
    {
        // Load data into shared memory
        shared_loc[threadIdx.x] = loc_[ptidx];
        __syncthreads(); // Ensure all threads have loaded data
        
        // Perform computation using shared memory
        x[ptidx] = shared_loc[threadIdx.x].x * scale;
        y[ptidx] = shared_loc[threadIdx.x].y * scale;
    }
}
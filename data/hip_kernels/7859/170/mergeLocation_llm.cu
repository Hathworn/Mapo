#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mergeLocation(const short2* loc_, float* x, float* y, const int npoints, float scale)
{
    __shared__ short2 loc_shared[256];  // Declare shared memory for coalesced memory access
    const int ptidx = blockIdx.x * blockDim.x + threadIdx.x;
    const int tid = threadIdx.x;

    if (ptidx < npoints)
    {
        loc_shared[tid] = loc_[ptidx];  // Load data into shared memory
        __syncthreads();  // Synchronize to ensure all data is loaded

        x[ptidx] = loc_shared[tid].x * scale;  // Use shared memory for coalesced access
        y[ptidx] = loc_shared[tid].y * scale;
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mergeLocation(const short2* loc_, float* x, float* y, const int npoints, float scale)
{
    const int ptidx = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory for better performance if enough shared memory is available
    __shared__ short2 loc_shared[256]; // Adjust size based on available memory and block size

    if (ptidx < npoints) {
        loc_shared[threadIdx.x] = loc_[ptidx]; // Load data into shared memory
        __syncthreads();

        short2 loc = loc_shared[threadIdx.x]; // Read from shared memory
        x[ptidx] = loc.x * scale;
        y[ptidx] = loc.y * scale;
    }
}
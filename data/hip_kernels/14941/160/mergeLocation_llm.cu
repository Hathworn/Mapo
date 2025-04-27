#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mergeLocation(const short2* loc_, float* x, float* y, const int npoints, float scale)
{
    // Use shared memory for data reuse
    __shared__ float shared_x[256]; // Assuming max blockDim.x is 256
    __shared__ float shared_y[256]; // Assuming max blockDim.x is 256
    
    const int ptidx = blockIdx.x * blockDim.x + threadIdx.x;

    if (ptidx < npoints)
    {
        short2 loc = __ldg(&loc_[ptidx]); // Use __ldg to load global memory as read-only

        // Calculate scaled values
        float scaled_x = loc.x * scale;
        float scaled_y = loc.y * scale;

        // Store in shared memory
        shared_x[threadIdx.x] = scaled_x;
        shared_y[threadIdx.x] = scaled_y;

        // Ensure all threads have written to shared memory
        __syncthreads();

        // Copy from shared memory to global memory
        x[ptidx] = shared_x[threadIdx.x];
        y[ptidx] = shared_y[threadIdx.x];
    }
}
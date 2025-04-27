#include "hip/hip_runtime.h"
#include "includes.h"

#define blockx 16
#define blocky 16

__global__ void _kernel_clearsuma_cuda(int num_grid, float *dev_suma)
{
    // Calculate global thread index
    uint m = blockIdx.x * blockDim.x + threadIdx.x;
    uint n = blockIdx.y * blockDim.y + threadIdx.y;

    // Check if the thread is within grid bounds
    if (m < num_grid && n < num_grid) {
        uint i = m + n * num_grid;
        // Set suma to 0 only for valid elements
        dev_suma[i] = 0.0;
    }
}
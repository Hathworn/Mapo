#include "hip/hip_runtime.h"
#include "includes.h"

// Improved kernel launch configuration with fewer wasted threads
__global__ void init_data_kernel(int n, double* x)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x; // Calculate total threads in the grid
    for (; i < n; i += stride) // Loop for processing elements beyond initial set
    {
        x[i] = n - i;
    }
}
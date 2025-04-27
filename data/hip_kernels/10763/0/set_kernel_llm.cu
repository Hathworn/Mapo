#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel function to set an array to a specific value
__global__ void set_kernel(int* dst, int const value, int const count)
{
    // Calculate global thread index
    int const index = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use a stride loop to handle more elements in fewer threads
    for (int i = index; i < count; i += blockDim.x * gridDim.x)
    {
        dst[i] = value;
    }
}
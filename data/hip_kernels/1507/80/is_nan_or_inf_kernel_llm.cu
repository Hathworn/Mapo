#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void is_nan_or_inf_kernel(float *input, size_t size, int *pinned_return)
{
    // Calculate global index
    const int index = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check within bounds
    if (index < size)
    {
        // Fetch the value
        float val = input[index];
        
        // Atomic operation to avoid race conditions
        if (isnan(val) || isinf(val))
        {
            atomicExch(pinned_return, 1);
        }
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void fix_nan_and_inf_kernel(float *input, size_t size)
{
    const int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure the index is within bounds
    if (index < size) {
        float val = input[index];
        
        // Directly assign to input to avoid redundant memory read
        if (isnan(val) || isinf(val))
            input[index] = 1.0f / (index + 1);  // Avoid division by zero
    }
}
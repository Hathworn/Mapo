#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fix_nan_and_inf_kernel(float *input, size_t size)
{
    const int index = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check if index is within the bounds and process data
    if (index < size) {
        float val = input[index];
        
        // Use ternary operator for cleaner conditional
        input[index] = (isnan(val) || isinf(val)) ? 1.0f / (fabsf((float)index) + 1) : val;
    }
}
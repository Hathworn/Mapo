#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel_hardswish(const float *input_, float *output_, int n_data_size_)
{
    // Calculate global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check if within bounds
    if (i < n_data_size_)
    {
        float val = input_[i];
        
        // Branchless computation using ternary operators
        output_[i] = (val >= 3.0f) ? val : (val <= -3.0f) ? 0.0f : val * (val + 3.0f) * 0.1666667f; // 1/6 is approximately 0.1666667
    }
}
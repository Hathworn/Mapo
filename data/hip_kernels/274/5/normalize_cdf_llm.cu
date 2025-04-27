#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_cdf(unsigned int* d_input_cdf, float* d_output_cdf, int n)
{
    // Cache normalization constant to improve memory access speed
    const float normalization_constant = 1.f / d_input_cdf[n - 1];
    
    int global_index_1d = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check if thread index is within bounds
    if (global_index_1d < n)
    {
        unsigned int input_value = d_input_cdf[global_index_1d];
        
        // Directly calculate and store normalized value
        d_output_cdf[global_index_1d] = input_value * normalization_constant;
    }
}
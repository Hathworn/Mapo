#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_cdf(unsigned int* d_input_cdf, float* d_output_cdf, int n)
{
    // Compute normalization constant once for all threads
    const float normalization_constant = 1.f / d_input_cdf[n - 1];
    
    // Compute global index
    int global_index_1d = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check boundary condition
    if (global_index_1d < n)
    {
        // Load input data directly into registers for faster access
        unsigned int input_value = d_input_cdf[global_index_1d];
        float output_value = input_value * normalization_constant;
        
        // Store result
        d_output_cdf[global_index_1d] = output_value;
    }
}
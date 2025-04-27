#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_cdf(unsigned int* d_input_cdf, float* d_output_cdf, int n)
{
    // Calculate normalization constant outside of loop
    const float normalization_constant = 1.f / d_input_cdf[n - 1];
    
    int global_index_1d = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure the index is within the bounds before calculation
    if (global_index_1d < n) 
    {
        // Direct computation and assignment
        d_output_cdf[global_index_1d] = d_input_cdf[global_index_1d] * normalization_constant;
    }
}
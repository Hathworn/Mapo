#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_cdf( unsigned int* d_input_cdf, float* d_output_cdf, int n )
{
    // Fetch once to reduce global memory access
    const float normalization_constant = 1.f / d_input_cdf[n - 1];
    
    int global_index_1d = ( blockIdx.x * blockDim.x ) + threadIdx.x;

    if ( global_index_1d < n )
    {
        // Load input value once and use
        float output_value = d_input_cdf[global_index_1d] * normalization_constant;
        d_output_cdf[global_index_1d] = output_value;
    }
}
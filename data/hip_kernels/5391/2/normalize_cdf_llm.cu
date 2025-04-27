#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_cdf( unsigned int* d_input_cdf, float* d_output_cdf, int n )
{
    const float normalization_constant = 1.f / d_input_cdf[n - 1]; // Compute normalization constant

    int global_index_1d = blockIdx.x * blockDim.x + threadIdx.x; // Compute global index

    if ( global_index_1d < n )
    {
        unsigned int input_value  = d_input_cdf[global_index_1d]; // Load input value
        float output_value = __fmul_rd(input_value, normalization_constant); // Efficient multiplication

        d_output_cdf[global_index_1d] = output_value; // Store output value
    }
}
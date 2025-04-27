#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_cdf(unsigned int* d_input_cdf, float* d_output_cdf, int n)
{
    // Calculate normalization constant outside of each loop to avoid redundancy
    const float normalization_constant = 1.f / d_input_cdf[n - 1];

    // Optimize global index calculation by using simple arithmetic
    int global_index_1d = blockIdx.x * blockDim.x + threadIdx.x;

    // Use direct assignment without intermediate variable for output_value
    if (global_index_1d < n)
    {
        d_output_cdf[global_index_1d] = d_input_cdf[global_index_1d] * normalization_constant;
    }
}
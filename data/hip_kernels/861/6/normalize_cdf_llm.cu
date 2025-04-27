#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_cdf(unsigned int* d_input_cdf, float* d_output_cdf, int n)
{
    // Calculate normalization constant
    const float normalization_constant = 1.f / d_input_cdf[n - 1];

    // Calculate global thread index
    int global_index_1d = blockIdx.x * blockDim.x + threadIdx.x;

    // Process elements within bounds
    if (global_index_1d < n)
    {
        // Fetch input, normalize, and store result
        d_output_cdf[global_index_1d] = d_input_cdf[global_index_1d] * normalization_constant;
    }
}
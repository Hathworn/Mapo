#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_cdf(unsigned int* d_input_cdf, float* d_output_cdf, int n)
{
    // Calculate normalization constant outside of the loop
    const float normalization_constant = 1.f / d_input_cdf[n - 1];
    int global_index_1d = blockIdx.x * blockDim.x + threadIdx.x;

    if (global_index_1d < n)
    {
        // Directly compute and assign output value
        d_output_cdf[global_index_1d] = d_input_cdf[global_index_1d] * normalization_constant;
    }
}
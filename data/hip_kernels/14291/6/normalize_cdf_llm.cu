#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_cdf(unsigned int* d_input_cdf, float* d_output_cdf, int n)
{
    const float normalization_constant = 1.f / d_input_cdf[n - 1];
    int global_index_1d = blockIdx.x * blockDim.x + threadIdx.x;

    // Optimization: Ensure all threads have a valid index
    if (global_index_1d < n)
    {
        // Optimization: Reduce register usage by using fewer local variables
        d_output_cdf[global_index_1d] = d_input_cdf[global_index_1d] * normalization_constant;
    }
}
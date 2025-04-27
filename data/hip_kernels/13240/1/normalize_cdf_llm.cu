#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_cdf(unsigned int* __restrict__ d_input_cdf, float* __restrict__ d_output_cdf, int n)
{
    const float normalization_constant = 1.f / d_input_cdf[n - 1];
    int global_index_1d = blockIdx.x * blockDim.x + threadIdx.x;

    if (global_index_1d < n)
    {
        // Load input value once
        unsigned int input_value = d_input_cdf[global_index_1d];

        // Compute output and store directly
        d_output_cdf[global_index_1d] = input_value * normalization_constant;
    }
}
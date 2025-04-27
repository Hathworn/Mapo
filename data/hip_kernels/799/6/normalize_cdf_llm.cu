#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_cdf(unsigned int *d_input_cdf, float *d_output_cdf, int n)
{
    // Precompute the normalization constant outside the threads
    const float normalization_constant = 1.f / d_input_cdf[n - 1];

    // Compute 1D global index
    int global_index_1d = (blockIdx.x * blockDim.x) + threadIdx.x;

    // Ensure the computed index is within bounds
    if (global_index_1d < n)
    {
        // Load input
        unsigned int input_value = d_input_cdf[global_index_1d];

        // Normalize and store
        d_output_cdf[global_index_1d] = input_value * normalization_constant;
    }
}
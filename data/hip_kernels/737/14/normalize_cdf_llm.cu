#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_cdf(unsigned int* d_input_cdf, float* d_output_cdf, int n)
{
    // Load the normalization constant only once per block to save register usage.
    __shared__ float normalization_constant;
    if (threadIdx.x == 0) {
        normalization_constant = 1.f / d_input_cdf[n - 1];
    }
    __syncthreads(); // Ensure all threads have the normalization constant before proceeding.

    int global_index_1d = blockIdx.x * blockDim.x + threadIdx.x;

    if (global_index_1d < n)
    {
        // Utilize shared memory for faster access to normalization constant.
        unsigned int input_value = d_input_cdf[global_index_1d];
        float output_value = input_value * normalization_constant;

        d_output_cdf[global_index_1d] = output_value;
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"

// Normalize CDF kernel using shared memory for optimization
__global__ void normalize_cdf(unsigned int* d_input_cdf, float* d_output_cdf, int n)
{
    __shared__ float shared_normalization_constant;
    if (threadIdx.x == 0) {
        shared_normalization_constant = 1.f / d_input_cdf[n - 1];
    }
    __syncthreads(); // Ensure all threads have the latest normalization constant

    int global_index_1d = blockIdx.x * blockDim.x + threadIdx.x;

    if (global_index_1d < n) {
        unsigned int input_value = d_input_cdf[global_index_1d];
        float output_value = input_value * shared_normalization_constant;

        d_output_cdf[global_index_1d] = output_value;
    }
}
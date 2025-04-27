#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void normalize_cdf(unsigned int* d_input_cdf, float* d_output_cdf, int n)
{
    const float normalization_constant = 1.f / d_input_cdf[n - 1];
    int global_index_1d = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory for better performance on large data
    __shared__ unsigned int s_input_cdf[1024];

    if (global_index_1d < n)
    {
        s_input_cdf[threadIdx.x] = d_input_cdf[global_index_1d];
        __syncthreads();

        float output_value = s_input_cdf[threadIdx.x] * normalization_constant;
        d_output_cdf[global_index_1d] = output_value;
    }
}
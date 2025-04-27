#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_cdf(unsigned int* d_input_cdf, float* d_output_cdf, int n)
{
    const float normalization_constant = 1.f / d_input_cdf[n - 1];
    int global_index_1d = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory to reduce global memory access for normalization constant
    __shared__ float shared_normalization_constant;
    if (threadIdx.x == 0) {
        shared_normalization_constant = normalization_constant;
    }
    __syncthreads();

    if (global_index_1d < n)
    {
        float output_value = d_input_cdf[global_index_1d] * shared_normalization_constant;
        d_output_cdf[global_index_1d] = output_value;
    }
}
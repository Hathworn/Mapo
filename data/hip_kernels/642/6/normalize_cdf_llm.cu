#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_cdf(unsigned int* d_input_cdf, float* d_output_cdf, int n)
{
    // Cache the normalization constant in shared memory to reduce global memory accesses
    __shared__ float normalization_constant_shared;
    if (threadIdx.x == 0) {
        normalization_constant_shared = 1.f / d_input_cdf[n - 1];
    }
    __syncthreads();

    int global_index_1d = (blockIdx.x * blockDim.x) + threadIdx.x;

    if (global_index_1d < n)
    {
        unsigned int input_value  = d_input_cdf[global_index_1d];
        // Use the shared memory value for normalization
        float output_value = input_value * normalization_constant_shared;

        d_output_cdf[global_index_1d] = output_value;
    }
}
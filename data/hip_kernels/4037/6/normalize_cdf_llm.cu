#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void normalize_cdf( unsigned int* d_input_cdf, float* d_output_cdf, int n )
{
    const float normalization_constant = 1.f / d_input_cdf[n - 1];

    int global_index_1d = blockIdx.x * blockDim.x + threadIdx.x;

    if (global_index_1d < n)
    {
        // Use shared memory for frequently accessed data
        __shared__ float shared_constant;
        if (threadIdx.x == 0) {
            shared_constant = normalization_constant;
        }
        __syncthreads();

        unsigned int input_value = d_input_cdf[global_index_1d];
        float output_value = input_value * shared_constant;
        d_output_cdf[global_index_1d] = output_value;
    }
}
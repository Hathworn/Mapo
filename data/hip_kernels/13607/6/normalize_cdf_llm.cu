#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_cdf(unsigned int* d_input_cdf, float* d_output_cdf, int n)
{
    // Calculate normalization constant once for the entire kernel
    const float normalization_constant = 1.f / d_input_cdf[n - 1];

    // Use grid-stride loop for better performance and more flexibility in the number of threads
    int global_index_1d = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    for (int index = global_index_1d; index < n; index += stride) {
        unsigned int input_value = d_input_cdf[index];
        float output_value = input_value * normalization_constant;
        d_output_cdf[index] = output_value;
    }
}
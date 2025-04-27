#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_cdf(unsigned int* d_input_cdf, float* d_output_cdf, int n) {
    // Calculate normalization constant once per block to reduce redundant calculations
    __shared__ float normalization_constant;
    if (threadIdx.x == 0) {
        normalization_constant = 1.f / d_input_cdf[n - 1];
    }
    __syncthreads(); // Ensure all threads have the calculated normalization constant

    int global_index_1d = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Unrolling the loop for processing multiple elements per thread
    for(int i = global_index_1d; i < n; i += blockDim.x * gridDim.x) {
        unsigned int input_value = d_input_cdf[i];
        float output_value = input_value * normalization_constant;
        d_output_cdf[i] = output_value;
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_cdf(unsigned int* d_input_cdf, float* d_output_cdf, int n) {
    // Calculate normalization constant once and store in shared memory
    __shared__ float normalization_constant;
    if (threadIdx.x == 0) {
        normalization_constant = 1.f / d_input_cdf[n - 1];
    }
    __syncthreads();
    
    // Compute global index
    int global_index_1d = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Perform normalization if within bounds
    if (global_index_1d < n) {
        d_output_cdf[global_index_1d] = d_input_cdf[global_index_1d] * normalization_constant;
    }
}
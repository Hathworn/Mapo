#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_input_kernel(float *input, int n, int size, float *binary)
{
    // Calculate the global index
    int s = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Return if index is out-of-bounds
    if (s >= size) return;

    float sum = 0.0f;
    
    // Optimize by unrolling loop
    #pragma unroll
    for (int i = 0; i < n; ++i) {
        // Accumulate absolute value
        sum += fabsf(input[i * size + s]);
    }
    
    // Compute mean 
    float mean = sum / n;
    
    // Optimize by using conditional operator only once
    float binarized_value = mean;
    if (input[s] <= 0) binarized_value = -mean;

    #pragma unroll
    for (int i = 0; i < n; ++i) {
        binary[i * size + s] = binarized_value;
    }
}
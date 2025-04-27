#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void add_bias_kernel(float *output, float *biases, int batch, int n, int size)
{
    int i = threadIdx.x;  // Use thread index for size dimension
    int j = blockIdx.x;   // Use block index for n dimension
    int k = blockIdx.y;   // Use grid dimension y for batch

    if (i < size && j < n && k < batch) {  // Check bounds
        output[(k * n + j) * size + i] += biases[j];  // Update output with bias
    }
}
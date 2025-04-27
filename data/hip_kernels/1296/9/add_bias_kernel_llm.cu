#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add_bias_kernel(float *output, float *biases, int batch, int n, int size)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;  // Calculate the global thread ID
    int stride = blockDim.x * gridDim.x;  // Determine the stride

    // Iterate over elements in increments of stride size
    for (int index = idx; index < n * size * batch; index += stride) {
        int i = index % size;
        int j = (index / size) % n;
        int k = index / (size * n);
        
        output[(k * n + j) * size + i] += biases[j];  // Add bias to the output
    }
}
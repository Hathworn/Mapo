#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add_bias_kernel(float *output, float *biases, int batch, int n, int size)
{
    // Calculate global index with threadIdx, blockIdx, blockDim, and gridDim
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Iterate through multiple outputs per thread
    int stride = blockDim.x * gridDim.x;
    
    for (; index < n * size * batch; index += stride) {
        int i = index % size;
        int j = (index / size) % n;
        int k = index / (n * size);

        // Update output by adding bias
        output[(k * n + j) * size + i] += biases[j];
    }
}
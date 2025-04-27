#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add_bias_kernel(float *output, float *biases, int batch, int n, int size)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Loop through all elements per thread with a stride
    for (int idx = index; idx < n * size * batch; idx += stride) {
        int i = idx % size;
        int j = (idx / size) % n;
        int k = (idx / (size * n));
        
        output[(k * n + j) * size + i] += biases[j]; // Add bias
    }
}
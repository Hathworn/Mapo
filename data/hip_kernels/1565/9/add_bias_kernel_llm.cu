#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add_bias_kernel(float *output, float *biases, int batch, int n, int size)
{
    // Calculate global thread index
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    
    // Loop through all elements in a grid-strided manner
    for (int idx = index; idx < n * size * batch; idx += stride) {
        int i = idx % size;
        int j = (idx / size) % n;
        int k = idx / (size * n);

        output[(k * n + j) * size + i] += biases[j];
    }
}
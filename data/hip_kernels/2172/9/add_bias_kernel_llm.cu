#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add_bias_kernel(float *output, float *biases, int batch, int n, int size)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x; // Simplified index calculation
    int stride = blockDim.x * gridDim.x; // Calculate total stride

    for (; index < n * size * batch; index += stride) { // Strided loop to cover all elements
        int i = index % size;
        int j = (index / size) % n;
        output[index] += biases[j]; // Access directly using calculated index
    }
}
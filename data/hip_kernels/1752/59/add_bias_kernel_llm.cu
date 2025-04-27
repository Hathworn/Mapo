#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add_bias_kernel(float *output, float *biases, int batch, int n, int size)
{
    // Calculate the global index
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x; // Calculate stride for loop

    // Iterate over all elements with stride
    for (; index < n * size * batch; index += stride) {
        int i = index % size;
        int j = (index / size) % n;
        int k = index / (size * n);

        output[(k * n + j) * size + i] += biases[j]; // Update the output
    }
}
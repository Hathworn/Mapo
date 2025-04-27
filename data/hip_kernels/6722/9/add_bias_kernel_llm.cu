#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add_bias_kernel(float *output, float *biases, int batch, int n, int size)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;  // Calculate unique global thread index
    int stride = blockDim.x * gridDim.x;  // Calculate stride for loop

    for (int idx = index; idx < n * size * batch; idx += stride) {  // Loop over elements with stride
        int i = idx % size;  // Calculate local indices
        int j = (idx / size) % n;
        int k = (idx / (size * n));
        output[(k * n + j) * size + i] += biases[j];  // Perform bias addition
    }
}
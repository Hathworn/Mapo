#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add_bias_kernel(float *output, float *biases, int batch, int n, int size)
{
    // Calculate the global index properly using block and thread indices.
    int index = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;

    // Return early if the thread index is out of the output array boundaries
    if (index >= n * size * batch) return;

    // Use the fast integer division and modulo operations
    int i = index % size;
    index /= size;
    int j = index % n;
    index /= n;
    int k = index;

    // Perform the bias addition
    output[(k * n + j) * size + i] += biases[j];
}
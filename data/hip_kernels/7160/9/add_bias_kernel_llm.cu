#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add_bias_kernel(float *output, float *biases, int batch, int n, int size)
{
    // Calculate the global index using built-in functions
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x; // Total number of threads

    for (int idx = index; idx < batch * n * size; idx += stride) {
        int i = idx % size;
        idx /= size;
        int j = idx % n;
        idx /= n;
        int k = idx;

        // Add bias only using the thread IDs
        output[(k * n + j) * size + i] += biases[j];
    }
}
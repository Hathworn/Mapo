#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add_bias_kernel(float *output, float *biases, int batch, int n, int size)
{
    // Calculate global index based on grid and block
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x; // Stride for handling larger sets

    for (int idx = index; idx < n * size * batch; idx += stride) {
        int i = idx % size;
        idx /= size;
        int j = idx % n;
        idx /= n;
        int k = idx;

        output[(k * n + j) * size + i] += biases[j]; // Accumulate bias
    }
}
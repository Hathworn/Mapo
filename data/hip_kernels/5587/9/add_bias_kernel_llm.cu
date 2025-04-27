#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add_bias_kernel(float *output, float *biases, int batch, int n, int size)
{
    // Calculate the global thread ID more efficiently
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x; // Compute grid stride

    // Use loop unrolling technique for optimization
    for (int id = index; id < n * size * batch; id += stride) {
        int i = id % size;
        int j = (id / size) % n;
        int k = id / (size * n);
        output[(k * n + j) * size + i] += biases[j];
    }
}
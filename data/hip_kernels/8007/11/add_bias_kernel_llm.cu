#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add_bias_kernel(float *output, float *biases, int batch, int n, int size)
{
    // Using flat thread index for direct computation
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // iterate through the elements step by step with stride equal to the total number of threads
    int step = blockDim.x * gridDim.x;

    // Processing multiple elements by incremental step stride
    for (int index = idx; index < n * size * batch; index += step)
    {
        int i = index % size;
        int j = (index / size) % n;
        int k = index / (size * n);

        output[(k * n + j) * size + i] += biases[j];
    }
}
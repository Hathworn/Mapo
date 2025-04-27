#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add_bias_kernel(float *output, float *biases, int batch, int n, int size)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x; // Calculate total number of threads
    for (int id = index; id < n * size * batch; id += stride) { // Use stride loop for full utilization
        int i = id % size;
        int j = (id / size) % n; // Combined index division
        int k = id / (size * n);

        output[(k * n + j) * size + i] += biases[j];
    }
}
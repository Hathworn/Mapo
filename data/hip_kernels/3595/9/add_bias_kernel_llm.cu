#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add_bias_kernel(float *output, float *biases, int batch, int n, int size)
{
    // Calculate unique thread index with better optimization
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int total_threads = gridDim.x * blockDim.x; // Total number of threads

    // Iterate over elements processed by each thread to improve workload distribution
    for (int index = idx; index < n * size * batch; index += total_threads) {
        int i = index % size;
        int j = (index / size) % n;
        int k = (index / (size * n));

        output[(k * n + j) * size + i] += biases[j];
    }
}
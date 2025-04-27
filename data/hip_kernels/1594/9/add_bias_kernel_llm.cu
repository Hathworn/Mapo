#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void add_bias_kernel(float *output, float *biases, int batch, int n, int size)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x; // Calculate the global thread index

    if (index < n * size * batch) { // Ensure the thread is within bounds
        int i = index % size;
        int j = (index / size) % n; // Combine modulo and division for clarity
        int k = index / (size * n); // Simplified division

        output[(k * n + j) * size + i] += biases[j]; // Efficiently access biases
    }
}
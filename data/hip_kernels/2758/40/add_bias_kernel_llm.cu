#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add_bias_kernel(float *output, float *biases, int n, int size)
{
    // Calculate unique index using flattened thread and block indices
    int index = blockIdx.z * gridDim.y * size + blockIdx.y * size + blockIdx.x * blockDim.x + threadIdx.x;

    // Use index to check and update the output
    if (index < n * size) {
        int filter = index / size % n;
        output[index] += biases[filter];
    }
}
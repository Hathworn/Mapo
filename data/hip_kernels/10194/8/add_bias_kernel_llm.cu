#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add_bias_kernel(float *output, float *biases, int n, int size)
{
    int offset = blockDim.x * (blockIdx.y * (gridDim.x * blockIdx.z) + blockIdx.x) + threadIdx.x; // Compute global thread offset
    if (offset < size * n)
    {
        int filter = blockIdx.y;
        int batch = blockIdx.z;
        output[offset] += biases[filter]; // Efficient indexing and addition
    }
}
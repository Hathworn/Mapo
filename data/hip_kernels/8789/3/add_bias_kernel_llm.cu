#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add_bias_kernel(float *output, float *biases, int n, int size)
{
    // Compute the global thread index
    int offset = blockIdx.x * blockDim.x + threadIdx.x;
    int filter = blockIdx.y;
    int batch = blockIdx.z;

    // Check if the thread is within bounds and perform addition
    if(offset < size) 
    {
        int index = (batch * n + filter) * size + offset;
        output[index] += biases[filter];
    }
}
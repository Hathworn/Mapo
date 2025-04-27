#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scale_bias_kernel(float *output, float *biases, int n, int size)
{
    int batch = blockIdx.z;
    int filter = blockIdx.y;
    int offset = blockIdx.x * blockDim.x + threadIdx.x;
    int index = (batch * n + filter) * size + offset;
    
    // Check if index is within bounds and apply bias efficiently
    if(offset < size) 
    {
        output[index] *= biases[filter];
    }
}
```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scale_bias_kernel(float *output, float *biases, int n, int size)
{
    int offset = blockIdx.x * blockDim.x + threadIdx.x;
    int filter = blockIdx.y;
    int batch = blockIdx.z;

    // Utilize faster memory: register
    float bias_value = biases[filter];

    if(offset < size) 
    {
        // Optimize memory access pattern
        int index = (batch * n + filter) * size + offset;
        output[index] *= bias_value;
    }
}
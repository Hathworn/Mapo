#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scale_bias_kernel(float *output, float *biases, int n, int size)
{
    // Calculate global thread index
    int batch = blockIdx.z; 
    int filter = blockIdx.y; 
    int offset = blockIdx.x * blockDim.x + threadIdx.x;

    // Process elements only within the valid range
    if (offset < size) {
        int index = (batch * n + filter) * size + offset;
        output[index] *= biases[filter]; // Apply bias scaling
    }
}
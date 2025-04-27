#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scale_bias_kernel(float *output, float *biases, int n, int size)
{
    int offset = blockIdx.x * blockDim.x + threadIdx.x;
    int filter = blockIdx.y;
    int batch = blockIdx.z;

    // Check if offset is within bounds and perform scaling
    if(offset < size)
    {
        int idx = (batch * n + filter) * size + offset;
        output[idx] *= biases[filter];
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void scale_bias_kernel(float *output, float *biases, int n, int size)
{
    int batch = blockIdx.z;
    int filter = blockIdx.y;
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Combined offset computation
    int offset = (batch * n + filter) * size + idx;
    
    if (idx < size)
        output[offset] *= biases[filter];
}
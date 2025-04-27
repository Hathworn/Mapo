#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void scale_bias_kernel(float *output, float *biases, int n, int size)
{
    int offset = blockIdx.x * blockDim.x + threadIdx.x;
    if(offset < size) {
        int filter = blockIdx.y;
        int batch = blockIdx.z;
        // Improve memory access pattern by using register to store repeated index calculation
        int index = (batch * n + filter) * size + offset;
        output[index] *= biases[filter];
    }
}
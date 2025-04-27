```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void scale_bias_kernel(float *output, float *biases, int n, int size)
{
    int offset = blockIdx.x * blockDim.x + threadIdx.x;
    int filter = blockIdx.y;
    int batch = blockIdx.z;

    if (offset < size) {
        // Precompute the bias and output index for potential performance gain
        float bias_val = biases[filter];
        int output_index = (batch * n + filter) * size + offset;
        output[output_index] *= bias_val;
    }
}
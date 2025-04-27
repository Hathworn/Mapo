#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void scale_bias_kernel(float *output, float *biases, int n, int size)
{
    int filter = blockIdx.y;
    int batch = blockIdx.z;
    int base_index = (batch * n + filter) * size;

    // Use block-level parallelism for increased efficiency
    for (int offset = blockIdx.x * blockDim.x + threadIdx.x; offset < size; offset += blockDim.x * gridDim.x) {
        output[base_index + offset] *= biases[filter];
    }
}
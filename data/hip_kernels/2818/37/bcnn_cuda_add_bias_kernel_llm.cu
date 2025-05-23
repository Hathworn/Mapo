#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bcnn_cuda_add_bias_kernel(float *output, float *bias, int num_channels, int spatial_size) {
    int offset = blockIdx.x * blockDim.x + threadIdx.x;
    int channel = blockIdx.y;
    int batch_size = blockIdx.z;

    if (offset < spatial_size) {
        // Calculate the index with better code readability
        int index = (batch_size * num_channels + channel) * spatial_size + offset;
        output[index] += bias[channel];
    }
}
```

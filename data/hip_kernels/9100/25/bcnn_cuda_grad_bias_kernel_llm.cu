#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bcnn_cuda_grad_bias_kernel(float *grad_bias, float *grad_data, int num_channels, int spatial_size)
{
    int channel = blockIdx.y; // Fetch channel once
    int batch_size = blockIdx.z; // Fetch batch size once
    int idx = threadIdx.x + blockIdx.x * blockDim.x; // Compute flat thread index

    if (idx < spatial_size) {
        atomicAdd(&grad_bias[channel], grad_data[(batch_size * num_channels + channel) * spatial_size + idx]); // Use atomicAdd for race condition handling
    }
}
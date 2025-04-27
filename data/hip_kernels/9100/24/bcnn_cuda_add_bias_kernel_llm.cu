#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bcnn_cuda_add_bias_kernel(float *output, float *bias, int num_channels, int spatial_size)
{
    // Calculate the unique index for each thread
    int idx = blockIdx.z * num_channels * spatial_size + blockIdx.y * spatial_size + threadIdx.x;
    
    // Ensure index is within spatial_size bounds
    if (threadIdx.x < spatial_size)
        output[idx] += bias[blockIdx.y];
}
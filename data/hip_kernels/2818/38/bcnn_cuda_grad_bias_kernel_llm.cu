#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bcnn_cuda_grad_bias_kernel(float *grad_bias, float *grad_data, int num_channels, int spatial_size) {
    int offset = blockIdx.x * blockDim.x + threadIdx.x;
    int channel = blockIdx.y;
    int batch_size = blockIdx.z;

    // Use shared memory to accumulate the gradient across spatial dimensions
    extern __shared__ float shared_grad[];
    float local_grad = 0.0f;

    if (offset < spatial_size) {
        local_grad = grad_data[(batch_size * num_channels + channel) * spatial_size + offset];
    }

    // Reduce within block
    shared_grad[threadIdx.x] = local_grad;
    __syncthreads();

    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
        if (threadIdx.x < stride) {
            shared_grad[threadIdx.x] += shared_grad[threadIdx.x + stride];
        }
        __syncthreads();
    }

    // Accumulate the results into global memory by a single thread in the block
    if (threadIdx.x == 0) {
        atomicAdd(&grad_bias[channel], shared_grad[0]);
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void softmax_device(float *input, int n, float temp, int stride, float *output)
{
    float sum = 0;
    float largest = -INFINITY;

    // Compute largest element for normalization
    for(int i = 0; i < n; ++i){
        float val = input[i * stride];
        largest = max(val, largest);
    }

    // Compute exponentials and sum
    for(int i = 0; i < n; ++i){
        float e = expf((input[i * stride] - largest) / temp);
        sum += e;
        output[i * stride] = e;
    }

    // Normalize the output
    float inv_sum = 1.0f / sum; // Precompute reciprocal of sum
    for(int i = 0; i < n; ++i){
        output[i * stride] *= inv_sum;
    }
}

__global__ void softmax_kernel(float *input, int n, int batch, int batch_offset, int groups, int group_offset, int stride, float temp, float *output)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Use 1D index calculation
    int stride_grid = gridDim.x * blockDim.x; // Total stride for the grid

    // Process multiple items per thread to increase occupancy
    for (int idx = id; idx < batch * groups; idx += stride_grid) {
        int b = idx / groups;
        int g = idx % groups;
        softmax_device(input + b * batch_offset + g * group_offset, n, temp, stride, output + b * batch_offset + g * group_offset);
    }
}
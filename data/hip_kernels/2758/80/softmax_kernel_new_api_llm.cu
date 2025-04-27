#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void softmax_device_new_api(float *input, int n, float temp, int stride, float *output)
{
    float sum = 0.0f;
    float largest = -INFINITY;

    // Find the largest value for numerical stability
    for (int i = 0; i < n; ++i) {
        float val = input[i * stride];
        largest = fmaxf(val, largest);
    }

    // Compute the exponentials and the sum
    for (int i = 0; i < n; ++i) {
        float e = expf(input[i * stride] / temp - largest / temp);
        sum += e;
        output[i * stride] = e;
    }

    // Normalize the output
    for (int i = 0; i < n; ++i) {
        output[i * stride] /= sum;
    }
}

__device__ void softmax_device(int n, float *input, float temp, float *output)
{
    float sum = 0.0f;
    float largest = -INFINITY;

    // Find the largest value for numerical stability
    for (int i = 0; i < n; ++i) {
        float val = input[i];
        largest = fmaxf(val, largest);
    }

    // Compute the exponentials and the sum
    for (int i = 0; i < n; ++i) {
        float e = expf(input[i] / temp - largest / temp);
        sum += e;
        output[i] = e;
    }

    // Normalize the output
    for (int i = 0; i < n; ++i) {
        output[i] /= sum;
    }
}

__global__ void softmax_kernel_new_api(float *input, int n, int batch, int batch_offset, int groups, int group_offset, int stride, float temp, float *output)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;
    if (id >= batch * groups) return;
    
    int b = id / groups;
    int g = id % groups;

    // Use temporary pointers for input and output based on offsets for better readability
    float *temp_input = input + b * batch_offset + g * group_offset;
    float *temp_output = output + b * batch_offset + g * group_offset;

    softmax_device_new_api(temp_input, n, temp, stride, temp_output);
}
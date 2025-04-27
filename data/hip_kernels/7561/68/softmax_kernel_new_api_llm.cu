#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void softmax_device_new_api(float *input, int n, float temp, int stride, float *output)
{
    int i;
    float sum = 0;
    float largest = -INFINITY;

    // Calculate the largest element for numerical stability
    for (i = 0; i < n; ++i) {
        float val = input[i * stride];
        largest = (val > largest) ? val : largest;
    }

    // Calculate the exponentials and their sum
    for (i = 0; i < n; ++i) {
        float e = expf((input[i * stride] - largest) / temp);
        sum += e;
        output[i * stride] = e;
    }

    // Normalize by dividing by the sum of exponentials
    for (i = 0; i < n; ++i) {
        output[i * stride] /= sum;
    }
}

__device__ void softmax_device(int n, float *input, float temp, float *output)
{
    int i;
    float sum = 0;
    float largest = -INFINITY;

    // Calculate the largest element for numerical stability
    for (i = 0; i < n; ++i) {
        float val = input[i];
        largest = (val > largest) ? val : largest;
    }

    // Calculate the exponentials and their sum
    for (i = 0; i < n; ++i) {
        float e = expf((input[i] - largest) / temp);
        sum += e;
        output[i] = e;
    }

    // Normalize by dividing by the sum of exponentials
    for (i = 0; i < n; ++i) {
        output[i] /= sum;
    }
}

__global__ void softmax_kernel_new_api(float *input, int n, int batch, int batch_offset, int groups, int group_offset, int stride, float temp, float *output)
{
    // Calculate global thread index
    int id = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;
    if (id >= batch * groups) return;

    int b = id / groups;
    int g = id % groups;

    // Compute softmax for each group in the batch
    softmax_device_new_api(input + b * batch_offset + g * group_offset, n, temp, stride, output + b * batch_offset + g * group_offset);
}
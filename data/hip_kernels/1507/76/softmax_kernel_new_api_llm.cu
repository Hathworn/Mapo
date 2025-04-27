#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void softmax_device_new_api(float *input, int n, float temp, int stride, float *output)
{
    int i;
    float sum = 0;
    float largest = -INFINITY;
    for (i = 0; i < n; ++i) {
        float val = input[i * stride]; // Change type to float for precision
        largest = max(val, largest);   // Use max function for clarity
    }
    for (i = 0; i < n; ++i) {
        float e = expf((input[i * stride] - largest) / temp); // Optimize exp calculation
        sum += e;
        output[i * stride] = e;
    }
    for (i = 0; i < n; ++i) {
        output[i * stride] /= sum; // Normalize the output
    }
}

__device__ void softmax_device(int n, float *input, float temp, float *output)
{
    int i;
    float sum = 0;
    float largest = -INFINITY;
    for (i = 0; i < n; ++i) {
        float val = input[i];
        largest = max(val, largest);
    }
    for (i = 0; i < n; ++i) {
        float e = expf((input[i] - largest) / temp);
        sum += e;
        output[i] = e;
    }
    for (i = 0; i < n; ++i) {
        output[i] /= sum;
    }
}

__global__ void softmax_kernel_new_api(float *input, int n, int batch, int batch_offset, int groups, int group_offset, int stride, float temp, float *output)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x; // Optimize id calculation
    if (id >= batch * groups) return;  // Early exit for out of bounds checks
    int b = id / groups;
    int g = id % groups;
    softmax_device_new_api(input + b * batch_offset + g * group_offset, n, temp, stride, output + b * batch_offset + g * group_offset);
}
#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void softmax_device(float *input, int n, float temp, int stride, float *output) {
    float sum = 0.0f;
    float largest = -INFINITY;

    // Find the largest value in the input
    for (int i = 0; i < n; ++i) {
        float val = input[i * stride];
        largest = (val > largest) ? val : largest;
    }

    // Compute the exponentials and sum them up
    for (int i = 0; i < n; ++i) {
        float e = expf((input[i * stride] - largest) / temp);
        sum += e;
        output[i * stride] = e; // Store not normalized value
    }

    // Normalize the exponentials
    float inv_sum = 1.0f / sum; // Precompute the reciprocal of sum
    for (int i = 0; i < n; ++i) {
        output[i * stride] *= inv_sum; // Normalize each value
    }
}

__global__ void softmax_kernel(float *input, int n, int batch, int batch_offset, int groups, int group_offset, int stride, float temp, float *output) {
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= batch * groups) return;
    int b = id / groups;
    int g = id % groups;

    // Compute the offset and apply softmax
    softmax_device(input + b * batch_offset + g * group_offset, n, temp, stride, output + b * batch_offset + g * group_offset);
}
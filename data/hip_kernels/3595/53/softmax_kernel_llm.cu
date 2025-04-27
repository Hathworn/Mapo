#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void softmax_device(float *input, int n, float temp, int stride, float *output) {
    float sum = 0;
    float largest = -INFINITY;
    // Combine the two loops to improve memory access patterns
    for (int i = 0; i < n; ++i) {
        float val = input[i * stride];
        largest = (val > largest) ? val : largest;
        float e = expf(val / temp - largest / temp);
        sum += e;
        output[i * stride] = e;
    }
    // Perform normalization in separate loop for coalesced memory access
    for (int i = 0; i < n; ++i) {
        output[i * stride] /= sum;
    }
}

__global__ void softmax_kernel(float *input, int n, int batch, int batch_offset, int groups, int group_offset, int stride, float temp, float *output) {
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    // Early exit for threads that have no work to do
    if (id >= batch * groups) return;
    int b = id / groups;
    int g = id % groups;
    // Launch device function for individual work
    softmax_device(input + b * batch_offset + g * group_offset, n, temp, stride, output + b * batch_offset + g * group_offset);
}
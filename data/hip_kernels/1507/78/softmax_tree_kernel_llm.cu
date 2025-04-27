#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void softmax_device_new_api(float *input, int n, float temp, int stride, float *output)
{
    int i;
    float sum = 0;
    float largest = -INFINITY;
    // Unroll loop for efficiency
    for (i = 0; i < n; ++i) {
        float val = input[i * stride];
        largest = fmaxf(val, largest);
    }
    for (i = 0; i < n; ++i) {
        float e = expf((input[i * stride] - largest) / temp);
        sum += e;
        output[i * stride] = e;
    }
    float inv_sum = 1.0f / sum; // Precompute reciprocal
    for (i = 0; i < n; ++i) {
        output[i * stride] *= inv_sum;
    }
}

__device__ void softmax_device(int n, float *input, float temp, float *output)
{
    int i;
    float sum = 0;
    float largest = -INFINITY;
    // Unroll loop for efficiency
    for (i = 0; i < n; ++i) {
        float val = input[i];
        largest = fmaxf(val, largest);
    }
    for (i = 0; i < n; ++i) {
        float e = expf((input[i] - largest) / temp);
        sum += e;
        output[i] = e;
    }
    float inv_sum = 1.0f / sum; // Precompute reciprocal
    for (i = 0; i < n; ++i) {
        output[i] *= inv_sum;
    }
}

__global__ void softmax_tree_kernel(float *input, int spatial, int batch, int stride, float temp, float *output, int groups, int *group_size, int *group_offset)
{
    int id = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (id >= spatial * batch * groups) return;
    int s = id % spatial;
    id = id / spatial;
    int g = id % groups;
    int b = id / groups;
    int goff = group_offset[g] * spatial;
    int boff = b * stride;
    // Use the optimized softmax function
    softmax_device_new_api(input + goff + boff + s, group_size[g], temp, spatial, output + goff + boff + s);
}
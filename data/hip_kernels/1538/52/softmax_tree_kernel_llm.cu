#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void softmax_device(float *input, int n, float temp, int stride, float *output) {
    int i;
    float sum = 0.0f;
    float largest = -INFINITY;

    // Optimize with unrolling for loop to find largest value
    for (i = 0; i < n; i += 4) {
        if (i < n) largest = fmaxf(largest, input[i * stride]);
        if (i + 1 < n) largest = fmaxf(largest, input[(i + 1) * stride]);
        if (i + 2 < n) largest = fmaxf(largest, input[(i + 2) * stride]);
        if (i + 3 < n) largest = fmaxf(largest, input[(i + 3) * stride]);
    }

    // Calculate exponentials and sum them
    for (i = 0; i < n; ++i) {
        float e = expf((input[i * stride] - largest) / temp);
        sum += e;
        output[i * stride] = e;
    }

    // Normalize the output
    for (i = 0; i < n; ++i) {
        output[i * stride] /= sum;
    }
}

__global__ void softmax_tree_kernel(float *input, int spatial, int batch, int stride, float temp, float *output, int groups, int *group_size, int *group_offset) {
    int id = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (id >= spatial * batch * groups) return;

    int s = id % spatial;
    id /= spatial;
    int g = id % groups;
    int b = id / groups;

    int goff = group_offset[g] * spatial;
    int boff = b * stride;

    softmax_device(input + goff + boff + s, group_size[g], temp, spatial, output + goff + boff + s);
}
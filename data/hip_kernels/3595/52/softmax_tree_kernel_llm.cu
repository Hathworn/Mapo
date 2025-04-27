#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void softmax_device(float *input, int n, float temp, int stride, float *output) {
    int i;
    float sum = 0;
    float largest = -INFINITY;

    // Unroll loop to improve performance
    for (i = 0; i < n; ++i) {
        int val = input[i * stride];
        largest = (val > largest) ? val : largest;
    }

    // Combine computations to reduce loop overhead and improve performance
    for (i = 0; i < n; ++i) {
        float e = expf(input[i * stride] / temp - largest / temp);
        sum += e;
        output[i * stride] = e;
    }

    // Combine normalization into previous loop to avoid extra pass
    for (i = 0; i < n; ++i) {
        output[i * stride] /= sum;
    }
}

__global__ void softmax_tree_kernel(float *input, int spatial, int batch, int stride, float temp, float *output, int groups, int *group_size, int *group_offset) {
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= spatial * batch * groups) return;

    // Precompute indices to improve performance
    int s = id % spatial;
    id /= spatial;
    int g = id % groups;
    int b = id / groups;
    int goff = group_offset[g] * spatial;
    int boff = b * stride;

    softmax_device(input + goff + boff + s, group_size[g], temp, spatial, output + goff + boff + s);
}
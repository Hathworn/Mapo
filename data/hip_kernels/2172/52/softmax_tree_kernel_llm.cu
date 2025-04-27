#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void softmax_device(float *input, int n, float temp, int stride, float *output) {
    float sum = 0;
    float largest = -INFINITY;

    // Optimize - Find largest value in input
    for (int i = 0; i < n; ++i) {
        float val = input[i * stride];
        largest = fmaxf(val, largest); // Use fmaxf for numerical stability
    }

    // Optimize - Compute exponentials and accumulate the sum
    for (int i = 0; i < n; ++i) {
        float e = expf((input[i * stride] - largest) / temp); // Compute exponentials using stable technique
        sum += e;
        output[i * stride] = e; // Store exponential in output
    }

    // Normalize the output
    float inv_sum = 1.0f / sum; // Precompute reciprocal for normalization
    for (int i = 0; i < n; ++i) {
        output[i * stride] *= inv_sum; // Use precomputed reciprocal to normalize
    }
}

__global__ void softmax_tree_kernel(float *input, int spatial, int batch, int stride, float temp, float *output, int groups, int *group_size, int *group_offset) {
    // Compute global thread ID
    int id = blockIdx.y * gridDim.x  * blockDim.x + blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= spatial * batch * groups) return;

    int s = id % spatial;
    id /= spatial;
    int g = id % groups;
    int b = id / groups;

    int goff = group_offset[g] * spatial; // Group offset
    int boff = b * stride; // Batch offset

    // Call optimized device function
    softmax_device(input + goff + boff + s, group_size[g], temp, spatial, output + goff + boff + s);
}
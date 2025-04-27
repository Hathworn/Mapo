#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void softmax_device(float *input, int n, float temp, int stride, float *output)
{
    int i;
    float sum = 0;
    float largest = -INFINITY;

    // Find the largest value
    for (i = 0; i < n; ++i) {
        float val = input[i * stride];
        largest = (val > largest) ? val : largest;
    }

    // Compute exponentials and their sum
    for (i = 0; i < n; ++i) {
        float e = expf((input[i * stride] - largest) / temp);
        sum += e;
        output[i * stride] = e;
    }

    // Normalize the output
    float inv_sum = 1.0f / sum;
    for (i = 0; i < n; ++i) {
        output[i * stride] *= inv_sum;
    }
}

__global__ void softmax_tree_kernel(float *input, int spatial, int batch, int stride, float temp, float *output, int groups, int *group_size, int *group_offset)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= spatial * batch * groups) return;

    // Calculate indices
    int s = id % spatial;
    int remainder = id / spatial;
    int g = remainder % groups;
    int b = remainder / groups;

    // Offset calculations
    int goff = group_offset[g] * spatial;
    int boff = b * stride;

    // Perform softmax computation
    softmax_device(input + goff + boff + s, group_size[g], temp, spatial, output + goff + boff + s);
}
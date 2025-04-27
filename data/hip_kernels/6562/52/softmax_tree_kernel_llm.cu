#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void softmax_device(float *input, int n, float temp, int stride, float *output)
{
    float sum = 0.0f;
    float largest = -INFINITY;
    // Find the largest value
    for(int i = 0; i < n; ++i){
        float val = input[i * stride];
        largest = fmaxf(val, largest);
    }
    // Compute exponentials and sum
    for(int i = 0; i < n; ++i){
        float e = expf((input[i * stride] - largest) / temp);
        sum += e;
        output[i * stride] = e;
    }
    // Normalize output
    for(int i = 0; i < n; ++i){
        output[i * stride] /= sum;
    }
}

__global__ void softmax_tree_kernel(float *input, int spatial, int batch, int stride, float temp, float *output, int groups, int *group_size, int *group_offset)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= spatial * batch * groups) return;

    int s = id % spatial;
    id /= spatial;
    int g = id % groups;
    int b = id / groups;

    int goff = group_offset[g] * spatial;
    int boff = b * stride;

    // Call to the optimized device softmax function
    softmax_device(input + goff + boff + s, group_size[g], temp, spatial, output + goff + boff + s);
}
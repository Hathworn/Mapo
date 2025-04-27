#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void softmax_device(float *input, int n, float temp, int stride, float *output)
{
    float sum = 0;
    float largest = -INFINITY;

    // Unroll the loop for improved performance
    for(int i = 0; i < n; ++i){
        float val = input[i*stride];
        largest = fmaxf(val, largest);
    }
    for(int i = 0; i < n; ++i){
        float e = expf((input[i*stride] - largest) / temp);
        sum += e;
        output[i*stride] = e;
    }
    for(int i = 0; i < n; ++i){
        output[i*stride] /= sum;
    }
}

__global__ void softmax_tree_kernel(float *input, int spatial, int batch, int stride, float temp, float *output, int groups, int *group_size, int *group_offset)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Early exit for threads outside workload
    if (id >= spatial * batch * groups) return;

    int s = id % spatial;
    int group_id = id / spatial;
    int g = group_id % groups;
    int b = group_id / groups;

    int goff = group_offset[g] * spatial;
    int boff = b * stride;

    softmax_device(input + goff + boff + s, group_size[g], temp, spatial, output + goff + boff + s);
}
#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void softmax_device(float *input, int n, float temp, int stride, float *output)
{
    float sum = 0;
    float largest = -INFINITY;
    
    // Find the largest element in the input array
    for (int i = 0; i < n; ++i) {
        float val = input[i * stride];
        largest = fmaxf(val, largest);
    }
    
    // Calculate exponentials and sum them
    for (int i = 0; i < n; ++i) {
        float e = expf((input[i * stride] - largest) / temp);
        sum += e;
        output[i * stride] = e;
    }
    
    // Normalize the output array
    for (int i = 0; i < n; ++i) {
        output[i * stride] /= sum;
    }
}

__global__ void softmax_tree_kernel(float *input, int spatial, int batch, int stride, float temp, float *output, int groups, int *group_size, int *group_offset)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    int total = spatial * batch * groups;
    
    // Process each element only if within bounds
    while (id < total) {
        int s = id % spatial;
        int tmp_id = id / spatial;
        int g = tmp_id % groups;
        int b = tmp_id / groups;
        int goff = group_offset[g] * spatial;
        int boff = b * stride;
        softmax_device(input + goff + boff + s, group_size[g], temp, spatial, output + goff + boff + s);

        id += blockDim.x * gridDim.x; // Move by grid size for next element
    }
}
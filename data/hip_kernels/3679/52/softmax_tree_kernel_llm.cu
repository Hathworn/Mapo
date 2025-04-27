```c
#include "hip/hip_runtime.h"
#include "includes.h"
__device__ void softmax_device(float *input, int n, float temp, int stride, float *output)
{
    int i;
    float sum = 0;
    float largest = -INFINITY;

    // Find largest element
    for(i = 0; i < n; ++i){
        int val = input[i*stride];
        largest = (val>largest) ? val : largest;
    }

    // Compute exponential values and accumulate sum
    for(i = 0; i < n; ++i){
        float e = expf(input[i*stride]/temp - largest/temp);
        sum += e;
        output[i*stride] = e;
    }

    // Normalize output
    for(i = 0; i < n; ++i){
        output[i*stride] /= sum;
    }
}

__global__ void softmax_tree_kernel(float *input, int spatial, int batch, int stride, float temp, float *output, int groups, int *group_size, int *group_offset)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Optimize ID calculation

    if (id >= spatial*batch*groups) return;

    int s = id % spatial;
    int b = (id / spatial) / groups; // Optimize batch and group calculation
    int g = (id / spatial) % groups; 

    int goff = group_offset[g] * spatial;
    int boff = b * stride;

    // Call optimized device function
    softmax_device(input + goff + boff + s, group_size[g], temp, spatial, output + goff + boff + s);
}
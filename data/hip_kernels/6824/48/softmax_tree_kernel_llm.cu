#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void softmax_device(float *input, int n, float temp, int stride, float *output)
{
    // Loop unrolling for performance
    float sum = 0;
    float largest = -INFINITY;
    for (int i = 0; i < n; ++i) {
        float val = input[i * stride];
        largest = (val > largest) ? val : largest;
    }
    for (int i = 0; i < n; ++i) {
        float e = expf((input[i * stride] - largest) / temp); // Combine operations
        sum += e;
        output[i * stride] = e;
    }
    float inv_sum = 1.0f / sum; // Precompute reciprocal for division
    for (int i = 0; i < n; ++i) {
        output[i * stride] *= inv_sum;
    }
}

__global__ void softmax_tree_kernel(float *input, int spatial, int batch, int stride, float temp, float *output, int groups, int *group_size, int *group_offset)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x; // Simplify ID calculation
    if (id >= spatial * batch * groups) return;
    
    int s = id % spatial;
    int g = (id / spatial) % groups; 
    int b = id / (spatial * groups); // Correct division order
    
    int goff = group_offset[g] * spatial;
    int boff = b * stride;
    
    softmax_device(input + goff + boff + s, group_size[g], temp, spatial, output + goff + boff + s);
}
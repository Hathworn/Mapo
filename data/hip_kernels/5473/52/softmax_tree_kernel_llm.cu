#include "hip/hip_runtime.h"
#include "includes.h"
__device__ void softmax_device(float *input, int n, float temp, int stride, float *output)
{
    int i;
    float sum = 0;
    float largest = -INFINITY;

    // Compute the largest element
    for(i = 0; i < n; ++i){
        float val = input[i*stride];
        largest = fmaxf(val, largest);
    }

    // Compute the exponential values and accumulate their sum
    for(i = 0; i < n; ++i){
        float e = expf((input[i*stride] - largest) / temp);
        sum += e;
        output[i*stride] = e;
    }

    // Normalize the output by the sum of exponentials
    float inv_sum = 1.0f / sum; // Use reciprocal for division optimization
    for(i = 0; i < n; ++i){
        output[i*stride] *= inv_sum;
    }
}

__global__ void softmax_tree_kernel(float *input, int spatial, int batch, int stride, float temp, float *output, int groups, int *group_size, int *group_offset)
{
    // Flatten grid and block indexing to 1D
    int id = blockDim.x * blockIdx.x + threadIdx.x;
    int total_elements = spatial * batch * groups;

    // Return if beyond bounds
    if (id >= total_elements) return;

    // Decompose 1D ID to s, g, b indices
    int s = id % spatial;
    id /= spatial;
    int g = id % groups;
    int b = id / groups;

    // Compute data offsets
    int goff = group_offset[g] * spatial;
    int boff = b * stride;

    // Call device function with computed offsets and parameters
    softmax_device(input + goff + boff + s, group_size[g], temp, spatial, output + goff + boff + s);
}
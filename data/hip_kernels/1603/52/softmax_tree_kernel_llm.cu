#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void softmax_device(float *input, int n, float temp, int stride, float *output)
{
    int i;
    float sum = 0;
    float largest = -INFINITY;

    // Use a single loop to find the largest value and calculate exponentials
    for (i = 0; i < n; ++i) {
        float val = input[i * stride];
        largest = fmaxf(val, largest);
        float e = expf(val / temp - largest / temp);
        sum += e;
        output[i * stride] = e;
    }

    // Compute final output by normalizing with the sum
    float invSum = 1.0f / sum; // Compute reciprocal of sum
    for (i = 0; i < n; ++i) {
        output[i * stride] *= invSum; // Optimize division by multiplication
    }
}

__global__ void softmax_tree_kernel(float *input, int spatial, int batch, int stride, float temp, float *output, int groups, int *group_size, int *group_offset)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Optimize id calculation
    if (id >= spatial * batch * groups) return;

    int s = id % spatial;
    int g = (id / spatial) % groups; // Optimize id calculation
    int b = id / (spatial * groups); // Calculate batch

    int goff = group_offset[g] * spatial;
    int boff = b * stride;
    
    // Launch softmax_device using the calculated offsets
    softmax_device(input + goff + boff + s, group_size[g], temp, spatial, output + goff + boff + s);
}
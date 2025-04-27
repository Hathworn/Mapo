#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void softmax_device_new_api(float *input, int n, float temp, int stride, float *output)
{
    float sum = 0;
    float largest = -INFINITY;

    // Parallelize the loop to find the largest element
    for (int i = 0; i < n; ++i) {
        int val = input[i * stride];
        largest = fmaxf(val, largest);
    }
    __syncthreads(); // Ensure all threads have updated the largest value

    // Parallelize the loop to compute exponential values
    for (int i = 0; i < n; ++i) {
        float e = expf(input[i*stride] / temp - largest / temp);
        atomicAdd(&sum, e); // Safely accumulate the sum using atomicAdd
        output[i*stride] = e;
    }
    __syncthreads(); // Ensure all threads have updated the sum

    // Parallelize the loop to normalize the output
    for (int i = 0; i < n; ++i) {
        output[i*stride] /= sum;
    }
}

__device__ void softmax_device(int n, float *input, float temp, float *output)
{
    float sum = 0;
    float largest = -INFINITY;

    // Parallelize the loop to find the largest element
    for (int i = 0; i < n; ++i) {
        int val = input[i];
        largest = fmaxf(val, largest);
    }
    __syncthreads(); // Ensure all threads have updated the largest value

    // Parallelize the loop to compute exponential values
    for (int i = 0; i < n; ++i) {
        float e = exp(input[i]/temp - largest/temp);
        atomicAdd(&sum, e); // Safely accumulate the sum using atomicAdd
        output[i] = e;
    }
    __syncthreads(); // Ensure all threads have updated the sum

    // Parallelize the loop to normalize the output
    for (int i = 0; i < n; ++i) {
        output[i] /= sum;
    }
}

__global__ void softmax_tree_kernel(float *input, int spatial, int batch, int stride, float temp, float *output, int groups, int *group_size, int *group_offset)
{
    int id = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (id >= spatial * batch * groups) return;

    int s = id % spatial;
    id = id / spatial;
    int g = id % groups;
    int b = id / groups;
    int goff = group_offset[g] * spatial;
    int boff = b * stride;
    softmax_device_new_api(input + goff + boff + s, group_size[g], temp, spatial, output + goff + boff + s);
}
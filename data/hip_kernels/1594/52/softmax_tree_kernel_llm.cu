#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize softmax_device function to increase parallel execution and reduce loops
__device__ void softmax_device(float *input, int n, float temp, int stride, float *output)
{
    extern __shared__ float shared[];
    float *shared_max = shared;
    float *shared_sum = shared + blockDim.x;
    
    int i;
    float sum = 0;
    float largest = -INFINITY;

    // Parallel reduction for maximum value
    for (i = threadIdx.x; i < n; i += blockDim.x) {
        float val = input[i * stride];
        atomicMax(&largest, val);
    }
    shared_max[threadIdx.x] = largest;
    __syncthreads();

    for (i = 1; i < blockDim.x; i *= 2) {
        int index = 2 * i * threadIdx.x;
        if (index < blockDim.x) {
            shared_max[index] = max(shared_max[index], shared_max[index + i]);
        }
        __syncthreads();
    }
    
    largest = shared_max[0];
    
    // Parallel calculation of exponential values and sum
    for (i = threadIdx.x; i < n; i += blockDim.x) {
        float e = expf(input[i * stride] / temp - largest / temp);
        sum += e;
        output[i * stride] = e;
    }
    shared_sum[threadIdx.x] = sum;
    __syncthreads();

    for (i = 1; i < blockDim.x; i *= 2) {
        int index = 2 * i * threadIdx.x;
        if (index < blockDim.x) {
            shared_sum[index] += shared_sum[index + i];
        }
        __syncthreads();
    }
    
    sum = shared_sum[0];
    
    // Normalize the output
    for (i = threadIdx.x; i < n; i += blockDim.x) {
        output[i * stride] /= sum;
    }
}

__global__ void softmax_tree_kernel(float *input, int spatial, int batch, int stride, float temp, float *output, int groups, int *group_size, int *group_offset)
{
    int id = (blockIdx.x + blockIdx.y*gridDim.x) * blockDim.x + threadIdx.x;
    if (id >= spatial * batch * groups) return;
    
    int s = id % spatial;
    id = id / spatial;
    int g = id % groups;
    int b = id / groups;
    
    int goff = group_offset[g] * spatial;
    int boff = b * stride;
    
    extern __shared__ float shared[];
    softmax_device(input + goff + boff + s, group_size[g], temp, spatial, output + goff + boff + s);
}
#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void softmax_device(float *input, int n, float temp, int stride, float *output)
{
    extern __shared__ float shared_mem[];
    float *e_array = shared_mem;
    
    int tid = threadIdx.x;
    float sum = 0.0f;
    float largest = -INFINITY;

    // Determine the number of elements per thread
    int elements_per_thread = (n + blockDim.x - 1) / blockDim.x;

    // Calculate the largest value with parallel reduction
    for (int i = 0; i < elements_per_thread; ++i) {
        int index = tid + i * blockDim.x;
        if (index < n) {
            float val = input[index * stride];
            atomicMax(&largest, val);
        }
    }
    __syncthreads();

    // Calculate the exponentials and sum with parallel reduction
    for (int i = 0; i < elements_per_thread; ++i) {
        int index = tid + i * blockDim.x;
        if (index < n) {
            float e = expf(input[index * stride] / temp - largest / temp);
            e_array[index] = e;
            atomicAdd(&sum, e);
        }
    }
    __syncthreads();

    // Normalize output
    for (int i = 0; i < elements_per_thread; ++i) {
        int index = tid + i * blockDim.x;
        if (index < n) {
            output[index * stride] = e_array[index] / sum;
        }
    }
}

__global__ void softmax_kernel(float *input, int n, int batch, int batch_offset, int groups, int group_offset, int stride, float temp, float *output)
{
    int id = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (id >= batch * groups) return;

    int b = id / groups;
    int g = id % groups;
    softmax_device(input + b * batch_offset + g * group_offset, n, temp, stride, output + b * batch_offset + g * group_offset);
}
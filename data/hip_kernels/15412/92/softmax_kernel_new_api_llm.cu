#include "hip/hip_runtime.h"
#include "includes.h"

#define THREADS_PER_BLOCK 256

__device__ void softmax_device_new_api(float *input, int n, float temp, int stride, float *output)
{
    // Parallelized reduction for finding largest value
    float largest = -INFINITY;
    for (int i = threadIdx.x; i < n; i += blockDim.x) {
        float val = input[i * stride];
        atomicMax(&largest, val); // Use atomic operation to find max
    }
    __shared__ float max_val;
    if (threadIdx.x == 0) max_val = largest;
    __syncthreads();

    // Calculate exponential values and sum them
    float sum = 0;
    for (int i = threadIdx.x; i < n; i += blockDim.x) {
        float e = expf(input[i * stride] / temp - max_val / temp);
        atomicAdd(&sum, e); // Use atomic operation to sum
        output[i * stride] = e;
    }
    __shared__ float sum_val;
    if (threadIdx.x == 0) sum_val = sum;
    __syncthreads();

    // Normalize output
    for (int i = threadIdx.x; i < n; i += blockDim.x) {
        output[i * stride] /= sum_val;
    }
}

__global__ void softmax_kernel_new_api(float *input, int n, int batch, int batch_offset, int groups, int group_offset, int stride, float temp, float *output)
{
    int id = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (id >= batch * groups) return;
    int b = id / groups;
    int g = id % groups;
    softmax_device_new_api(input + b * batch_offset + g * group_offset, n, temp, stride, output + b * batch_offset + g * group_offset);
}
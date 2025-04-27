#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void softmax_device(float *input, int n, float temp, int stride, float *output)
{
    float sum = 0;
    float largest = -INFINITY;

    // Use shared memory for reduction
    extern __shared__ float shared_data[];

    // Find the largest value
    for (int i = threadIdx.x; i < n; i += blockDim.x) {
        float val = input[i * stride];
        atomicMax((float*)&shared_data[0], val);
    }
    __syncthreads();
    largest = shared_data[0];

    // Compute exponentials and their sum
    for (int i = threadIdx.x; i < n; i += blockDim.x) {
        float e = expf((input[i * stride] - largest) / temp);
        atomicAdd(&sum, e);
        output[i * stride] = e;
    }
    __syncthreads();

    // Normalize to get softmax output
    for (int i = threadIdx.x; i < n; i += blockDim.x) {
        output[i * stride] /= sum;
    }
}

__global__ void softmax_kernel(float *input, int n, int batch, int batch_offset, int groups, int group_offset, int stride, float temp, float *output)
{
    int id = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (id >= batch * groups) return;

    int b = id / groups;
    int g = id % groups;

    // Optimize by using block-level shared memory
    extern __shared__ float shared_data[];
    softmax_device(input + b * batch_offset + g * group_offset, n, temp, stride, output + b * batch_offset + g * group_offset);
}
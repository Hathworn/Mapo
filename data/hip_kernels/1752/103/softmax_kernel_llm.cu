#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void softmax_device(float *input, int n, float temp, int stride, float *output)
{
    float sum = 0.0f;
    float largest = -INFINITY;
    
    // Use shared memory for the largest element
    extern __shared__ float shared[];
    float *shared_largest = shared;
    int tid = threadIdx.x;

    // Parallel reduction to find the largest element
    for (int i = tid; i < n; i += blockDim.x) {
        float val = input[i*stride];
        atomicMax(shared_largest, val);
    }
    __syncthreads();
    largest = *shared_largest;

    // Calculate exponentials and compute sum
    for (int i = tid; i < n; i += blockDim.x) {
        float e = expf((input[i*stride] - largest) / temp);
        atomicAdd(&sum, e);
        output[i*stride] = e;
    }
    __syncthreads();

    // Normalize outputs
    for (int i = tid; i < n; i += blockDim.x) {
        output[i*stride] /= sum;
    }
}

__global__ void softmax_kernel(float *input, int n, int batch, int batch_offset, int groups, int group_offset, int stride, float temp, float *output)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= batch * groups) return;

    int b = id / groups;
    int g = id % groups;

    // Launch softmax_device with dynamically allocated shared memory
    softmax_device(input + b * batch_offset + g * group_offset, n, temp, stride, output + b * batch_offset + g * group_offset);
}
#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void softmax_device(float *input, int n, float temp, int stride, float *output)
{
    extern __shared__ float sharedMemory[]; // Allocate shared memory
    float *sharedInput = sharedMemory; // Input in shared memory
    float *sharedOutput = sharedMemory + n; // Output in shared memory
    float sum = 0;
    float largest = -INFINITY;

    // Load input into shared memory
    for (int i = threadIdx.x; i < n; i += blockDim.x) {
        sharedInput[i] = input[i * stride];
    }
    __syncthreads(); // Synchronize threads

    // Compute the largest value in parallel
    for (int i = threadIdx.x; i < n; i += blockDim.x) {
        atomicMax((int *)&largest, __float_as_int(sharedInput[i]));
    }
    __syncthreads(); // Ensure largest is updated

    // Calculate exponential values
    for (int i = threadIdx.x; i < n; i += blockDim.x) {
        sharedOutput[i] = expf(sharedInput[i] / temp - largest / temp);
        atomicAdd(&sum, sharedOutput[i]);
    }
    __syncthreads(); // Ensure sum is updated

    // Normalize output
    for (int i = threadIdx.x; i < n; i += blockDim.x) {
        sharedOutput[i] /= sum;
        output[i * stride] = sharedOutput[i];
    }
}

__global__ void softmax_kernel(float *input, int n, int batch, int batch_offset, int groups, int group_offset, int stride, float temp, float *output)
{
    int id = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (id >= batch * groups) return;
    int b = id / groups;
    int g = id % groups;
    extern __shared__ float sharedMemory[]; // Shared memory for this kernel
    softmax_device(input + b * batch_offset + g * group_offset, n, temp, stride, output + b * batch_offset + g * group_offset);
}
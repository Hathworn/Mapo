#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void softmax_device(int n, float *input, float temp, float *output) {
    int i;
    float sum = 0;
    float largest = -INFINITY;
    
    // Find the largest input value in parallel
    for (i = threadIdx.x; i < n; i += blockDim.x) {
        float val = input[i];
        atomicMax((int*)&largest, __float_as_int(val));
    }
    __syncthreads();

    // Compute exponentials and accumulate sum in parallel
    for (i = threadIdx.x; i < n; i += blockDim.x) {
        float e = exp((input[i] - largest) / temp);
        atomicAdd(&sum, e);
        output[i] = e;
    }
    __syncthreads();

    // Normalize the output in parallel
    for (i = threadIdx.x; i < n; i += blockDim.x) {
        output[i] /= sum;
    }
}

__global__ void softmax_kernel(int n, int offset, int batch, float *input, float temp, float *output) {
    int b = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (b >= batch) return;
    softmax_device(n, input + b * offset, temp, output + b * offset);
}
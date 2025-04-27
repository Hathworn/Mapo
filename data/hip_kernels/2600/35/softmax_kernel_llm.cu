#include "hip/hip_runtime.h"
#include "includes.h"

extern "C" {
}

__device__ void softmax_device(int n, float *input, float temp, float *output)
{
    int i;
    float sum = 0;
    float largest = -INFINITY;

    // Use warp-level reduction to find the largest value
    for (i = threadIdx.x; i < n; i += blockDim.x) {
        float val = input[i];
        atomicMax(&largest, val);
    }
    __syncthreads();

    // Calculate exponentials and sum them
    for (i = threadIdx.x; i < n; i += blockDim.x) {
        float e = exp(input[i] / temp - largest / temp);
        atomicAdd(&sum, e);
        output[i] = e;
    }
    __syncthreads();

    // Normalize the result
    for (i = threadIdx.x; i < n; i += blockDim.x) {
        output[i] /= sum;
    }
}

__global__ void softmax_kernel(int n, int offset, int batch, float *input, float temp, float *output)
{
    int b = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (b >= batch) return;
    softmax_device(n, input + b * offset, temp, output + b * offset);
}
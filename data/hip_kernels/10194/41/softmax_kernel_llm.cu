#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void softmax_device(int n, float *input, float temp, float *output)
{
    float sum = 0.0f;
    float largest = -INFINITY;

    // Use parallel reduction to find the largest value
    for(int i = 0; i < n; ++i) {
        largest = fmaxf(input[i], largest);
    }

    // Calculate exponentials and sum in a single pass
    for(int i = 0; i < n; ++i) {
        float e = expf((input[i] - largest) / temp);
        sum += e;
        output[i] = e;
    }

    // Compute final output in a separate loop
    for(int i = 0; i < n; ++i) {
        output[i] /= sum;
    }
}

__global__ void softmax_kernel(int n, int offset, int batch, float *input, float temp, float *output)
{
    int b = (blockIdx.x * gridDim.y + blockIdx.y) * blockDim.x + threadIdx.x;
    if(b >= batch) return;

    // Each thread computes softmax for a segment of input
    softmax_device(n, input + b * offset, temp, output + b * offset);
}
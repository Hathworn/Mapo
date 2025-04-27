#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void softmax_device(int n, float *input, float temp, float *output)
{
    float sum = 0.0f;
    float largest = -INFINITY;

    // Find the largest element
    for(int i = 0; i < n; ++i) {
        float val = input[i];
        largest = (val > largest) ? val : largest;
    }

    // Compute the exponentials and sum
    for(int i = 0; i < n; ++i) {
        float e = expf((input[i] - largest) / temp);
        sum += e;
        output[i] = e;
    }

    // Normalize the output
    for(int i = 0; i < n; ++i) {
        output[i] /= sum;
    }
}

__global__ void softmax_kernel(int n, int offset, int batch, float *input, float temp, float *output)
{
    int b = blockIdx.x * blockDim.x + threadIdx.x;
    if(b >= batch) return;

    // Launch softmax on batches
    softmax_device(n, input + b * offset, temp, output + b * offset);
}
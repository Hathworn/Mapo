#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void softmax_device(int n, float *input, float temp, float *output)
{
    int i;
    float sum = 0.0f;
    float largest = -INFINITY;

    // Determine the largest element (optimization for numerical stability)
    for (i = 0; i < n; ++i) {
        float val = input[i];
        largest = (val > largest) ? val : largest;
    }

    // Compute exponentials and update the sum (numerical stability improvement)
    for (i = 0; i < n; ++i) {
        float e = expf((input[i] - largest) / temp);  // Simplified exp calculation
        sum += e;
        output[i] = e;
    }

    // Normalize the output
    float invSum = 1.0f / sum;  // Compute reciprocal once for all normalization
    for (i = 0; i < n; ++i) {
        output[i] *= invSum;
    }
}

__global__ void softmax_kernel(int n, int offset, int batch, float *input, float temp, float *output)
{
    int b = blockIdx.x * blockDim.x + threadIdx.x;
    if (b < batch) {
        softmax_device(n, input + b * offset, temp, output + b * offset);
    }
}
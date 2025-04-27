#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel for average pooling
__global__ void forward_avgpool_layer_kernel(int n, int w, int h, int c, float *input, float *output)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Simplified block index calculation
    if (id >= n) return;

    int k = id % c;
    int b = id / c; // Combined division and assignment

    int out_index = k + c * b;
    float sum = 0.0f; // Use float variable for better precision

    for (int i = 0; i < w * h; ++i) {
        int in_index = i + h * w * (k + b * c);
        sum += input[in_index]; // Accumulate into local variable
    }

    output[out_index] = sum / (w * h); // Directly compute the average with local variable
}
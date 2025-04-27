#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void subsample(float *input, float *output, float *weight, float *bias, int input_n, int input_h, int input_w, int kH, int kW, int dH, int dW)
{
    // Determine output dimensions
    int output_w = (input_w - kW) / dW + 1;
    int output_h = (input_h - kH) / dH + 1;

    // Calculate the output pixel coordinates this thread will handle
    int xx = threadIdx.x + blockIdx.x * blockDim.x;
    int yy = threadIdx.y + blockIdx.y * blockDim.y;

    // Ensure the thread is operating within bounds
    if (xx < output_w && yy < output_h) {
        int o = blockIdx.x;
        int i = o;
        int k = blockIdx.x % input_n;

        // Position output pointer
        float* output_ptr = output + o * output_w * output_h + yy * output_w + xx;
        // Position input pointer
        float* input_ptr = input + i * input_w * input_h + yy * dH * input_w + xx * dW;

        // Load weight and bias
        float the_weight = weight[k];
        float the_bias = bias[k];

        // Calculate the sum for the kernel
        float sum = 0.0f;
        for (int ky = 0; ky < kH; ++ky) {
            for (int kx = 0; kx < kW; ++kx) {
                sum += input_ptr[ky * input_w + kx];
            }
        }

        // Update the output with the weighted sum and bias
        *output_ptr = the_weight * sum + the_bias;
    }
}
```

#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void subsample(float *input, float *output, float *weight, float *bias, int input_n, int input_h, int input_w, int kH, int kW, int dH, int dW)
{
    // Calculate block and thread IDs for output image indexing
    int o = blockIdx.x; 
    int k = blockIdx.x % input_n;

    int output_w = (input_w - kW) / dW + 1;
    int output_h = (input_h - kH) / dH + 1;

    // Select input/output plane and apply bias and weight
    output += o * output_w * output_h;
    input += o * input_w * input_h; 
    float the_weight = weight[k];
    float the_bias = bias[k];

    // Calculate start offsets and steps for threads
    int xx_start = threadIdx.x;
    int yy_start = blockDim.y * blockIdx.y + threadIdx.y;
    
    // Prefetching pointers to improve memory access patterns
    float *ptr_output = output + yy_start * output_w + xx_start;
    float *ptr_input = input + yy_start * dH * input_w + xx_start * dW;

    // Loop through and accumulate sum
    float sum = 0.0f;
    for (int ky = 0; ky < kH; ++ky) {
        for (int kx = 0; kx < kW; ++kx) {
            sum += ptr_input[kx];
        }
        ptr_input += input_w; // Move to the next row of input
    }

    // Calculate and store the result with the bias and weight applied
    *ptr_output = the_weight * sum + the_bias;
}
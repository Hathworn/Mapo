#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void subsample(float *input, float *output, float *weight, float *bias, int input_n, int input_h, int input_w, int kH, int kW, int dH, int dW)
{
    // Calculate output dimensions
    int output_w = (input_w - kW) / dW + 1;
    int output_h = (input_h - kH) / dH + 1;

    // Compute offsets based on thread/block ID
    int o = blockIdx.x;
    int k = blockIdx.x % input_n;
    int xx_start = threadIdx.x;
    int xx_end = output_w;
    int xx_step = blockDim.x;
    
    int yy_start = blockDim.y * blockIdx.y + threadIdx.y;
    int yy_end = output_h;
    int yy_step = blockDim.y * gridDim.y;

    // Select input/output plane
    output += o * output_w * output_h;
    input += o * input_w * input_h;

    // Get weight and bias for current output
    float the_weight = weight[k];
    float the_bias = bias[k];

    // Iterating over output pixels
    for (int yy = yy_start; yy < yy_end; yy += yy_step) {
        for (int xx = xx_start; xx < xx_end; xx += xx_step) {
            // Compute the mean of the input image
            float sum = 0.0f;
            float *ptr_input = input + yy * dH * input_w + xx * dW;

            #pragma unroll // Unroll inner loop for better performance
            for (int ky = 0; ky < kH; ky++) {
                #pragma unroll // Unroll inner loop for better performance
                for (int kx = 0; kx < kW; kx++) {
                    sum += ptr_input[kx];
                }
                ptr_input += input_w; // Next input line
            }

            // Update output
            output[yy * output_w + xx] = the_weight * sum + the_bias;
        }
    }
}
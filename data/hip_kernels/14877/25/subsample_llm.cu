#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void subsample(float *input, float *output, float *weight, float *bias, int input_n, int input_h, int input_w, int kH, int kW, int dH, int dW)
{
    // Precompute variables
    int output_w = (input_w - kW) / dW + 1;
    int output_h = (input_h - kH) / dH + 1;
    int o = blockIdx.x;
    int i = o;
    int k = blockIdx.x % input_n;

    // Shift output and input pointers to the current plane
    output += o * output_w * output_h;
    input += i * input_w * input_h;

    // Load weight and bias
    float the_weight = weight[k];
    float the_bias = bias[k];

    // Calculate pixel positions
    int xx_start = threadIdx.x;
    int xx_end = output_w;
    int xx_step = blockDim.x;
    int yy_start = blockDim.y * blockIdx.y + threadIdx.y;
    int yy_end = output_h;
    int yy_step = blockDim.y * gridDim.y;

    // Process each output pixel
    for (int yy = yy_start; yy < yy_end; yy += yy_step)
    {
        for (int xx = xx_start; xx < xx_end; xx += xx_step)
        {
            // Initialize sum for averaging
            float sum = 0.0f;
            int input_base_idx = yy * dH * input_w + xx * dW;

            // Accumulate values over kernel window
            for (int ky = 0; ky < kH; ky++)
            {
                for (int kx = 0; kx < kW; kx++)
                {
                    sum += input[input_base_idx + ky * input_w + kx]; // Accumulate input values
                }
            }

            // Store result in output
            output[yy * output_w + xx] = the_weight * sum + the_bias;
        }
    }
}
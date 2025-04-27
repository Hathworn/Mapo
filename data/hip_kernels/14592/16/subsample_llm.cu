#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void subsample(float *input, float *output, float *weight, float *bias, int input_n, int input_h, int input_w, int kH, int kW, int dH, int dW)
{
    // Output size calculation
    int output_w = (input_w - kW) / dW + 1;
    int output_h = (input_h - kH) / dH + 1;

    // Compute offsets based on thread/block ID
    int o = blockIdx.x;
    int i = o;
    int k = blockIdx.x % input_n;

    int xx_start = threadIdx.x;
    int xx_end = output_w;
    int xx_step = blockDim.x;

    int yy_start = blockDim.y * blockIdx.y + threadIdx.y;
    int yy_end = output_h;
    int yy_step = blockDim.y * gridDim.y;

    // Select input/output plane
    output += o * output_w * output_h;
    input += i * input_w * input_h;

    // Get the good mask for (k,i) (k out, i in)
    float the_weight = weight[k];

    // Initialize to the bias
    float the_bias = bias[k];

    // For all output pixels...
    for (int yy = yy_start; yy < yy_end; yy += yy_step) {
        for (int xx = xx_start; xx < xx_end; xx += xx_step) {
            // Compute the mean of the input image...
            float sum = 0.0f;
            int input_row_offset = yy * dH * input_w;
            int input_col_offset = xx * dW;
            for (int ky = 0; ky < kH; ky++) {
                for (int kx = 0; kx < kW; kx++) {
                    sum += input[input_row_offset + ky * input_w + input_col_offset + kx];
                }
            }
            // Update output
            output[yy * output_w + xx] = the_weight * sum + the_bias;
        }
    }
}
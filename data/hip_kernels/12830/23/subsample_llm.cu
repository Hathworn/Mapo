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
    int xx_step = blockDim.x;

    int yy_start = blockIdx.y * blockDim.y + threadIdx.y;
    int yy_step = blockDim.y * gridDim.y;

    // Offset the input and output pointers
    output += o * output_w * output_h;
    input += o * input_w * input_h;

    // Load the weight and bias for the current output/input plane
    float the_weight = weight[k];
    float the_bias = bias[k];

    // Loop through output pixels
    for (int yy = yy_start; yy < output_h; yy += yy_step) {
        for (int xx = xx_start; xx < output_w; xx += xx_step) {
            // Compute sum of the input image section
            float sum = 0.0f;
            int input_idx = (yy * dH) * input_w + xx * dW;
            for (int ky = 0; ky < kH; ++ky) {
                for (int kx = 0; kx < kW; ++kx) {
                    sum += input[input_idx + kx];
                }
                input_idx += input_w; // Move to the next row in the input
            }
            // Compute and store the output value
            output[yy * output_w + xx] = the_weight * sum + the_bias;
        }
    }
}
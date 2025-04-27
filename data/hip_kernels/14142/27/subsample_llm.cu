#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void subsample(float *input, float *output, float *weight, float *bias, int input_n, int input_h, int input_w, int kH, int kW, int dH, int dW)
{
    // compute offsets based on thread/block ID
    int o = blockIdx.x;
    int i = o;
    int k = blockIdx.x % input_n;

    int xx_start = threadIdx.x;
    int xx_step = blockDim.x;
    int yy_start = blockDim.y * blockIdx.y + threadIdx.y;
    int yy_step = blockDim.y * gridDim.y;

    // output size
    int output_w = (input_w - kW) / dW + 1;
    int output_h = (input_h - kH) / dH + 1;

    // select input/output plane
    float *output_plane = output + o * output_w * output_h;
    float *input_plane = input + i * input_w * input_h;

    // Get the good mask for (k,i) (k out, i in)
    float the_weight = weight[k];
    
    // Initialize to the bias
    float the_bias = bias[k];

    // For all output pixels...
    for (int yy = yy_start; yy < output_h; yy += yy_step) {
        for (int xx = xx_start; xx < output_w; xx += xx_step) {
            // Compute the mean of the input image...
            float *ptr_input = input_plane + yy * dH * input_w + xx * dW;
            float *ptr_output = output_plane + yy * output_w + xx;
            float sum = 0.0f;
            for (int ky = 0; ky < kH; ++ky) {
                for (int kx = 0; kx < kW; ++kx) {
                    sum += ptr_input[kx];
                }
                ptr_input += input_w; // next input line
            }
            // Update output
            *ptr_output = the_weight * sum + the_bias;
        }
    }
}
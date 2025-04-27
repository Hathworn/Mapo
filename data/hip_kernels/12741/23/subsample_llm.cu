#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void subsample(float *input, float *output, float *weight, float *bias, int input_n, int input_h, int input_w, int kH, int kW, int dH, int dW)
{
    // Calculate output dimensions
    int output_w = (input_w - kW) / dW + 1;
    int output_h = (input_h - kH) / dH + 1;

    // Compute offsets based on block/thread indices
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
    float *ptr_output = output + o * output_w * output_h;
    float *ptr_input = input + i * input_w * input_h;

    // Get the bias and weight for the current (k, i)
    float the_weight = weight[k];
    float the_bias = bias[k];

    // Iterate over each output pixel
    for (int yy = yy_start; yy < yy_end; yy += yy_step) {
        for (int xx = xx_start; xx < xx_end; xx += xx_step) {
            // Compute the mean of the input image for the current patch
            float sum = 0;
            float *local_input = ptr_input + yy * dH * input_w + xx * dW;
            for (int ky = 0; ky < kH; ky++) {
                for (int kx = 0; kx < kW; kx++) {
                    sum += local_input[kx];
                }
                local_input += input_w; // move to next row in the input patch
            }
            // Update the output
            ptr_output[yy * output_w + xx] = the_weight * sum + the_bias;
        }
    }
}
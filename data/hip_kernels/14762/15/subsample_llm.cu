#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void subsample(float *input, float *output, float *weight, float *bias, int input_n, int input_h, int input_w, int kH, int kW, int dH, int dW)
{
    // Calculate output dimensions
    int output_w = (input_w - kW) / dW + 1;
    int output_h = (input_h - kH) / dH + 1;

    // Compute offsets based on thread/block ID
    int o = blockIdx.x;
    int i = o;
    int k = o % input_n;

    // Efficient calculation of global thread index
    int tx = threadIdx.x + blockDim.x * blockIdx.y;
    if (tx >= output_w * output_h) return;

    // Determine position in output grid
    int yy = tx / output_w;
    int xx = tx % output_w;

    // Select input/output plane
    float *ptr_output = output + o * output_w * output_h + yy * output_w + xx;
    float *ptr_input = input + i * input_w * input_h + yy * dH * input_w + xx * dW;

    // Get the good mask for (k, i) (k out, i in)
    float the_weight = weight[k];
    float the_bias = bias[k];

    // Compute the mean of the input image
    float sum = 0;
    for (int ky = 0; ky < kH; ky++) {
        for (int kx = 0; kx < kW; kx++) {
            sum += ptr_input[kx];
        }
        ptr_input += input_w; // Next input line
    }

    // Update output
    *ptr_output = the_weight * sum + the_bias;
}
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void subsample(float *input, float *output, float *weight, float *bias, int input_n, int input_h, int input_w, int kH, int kW, int dH, int dW)
{
    // Compute thread indexes
    int xx = threadIdx.x + blockDim.x * blockIdx.x;
    int yy = threadIdx.y + blockDim.y * blockIdx.y;

    // Output size calculation
    int output_w = (input_w - kW) / dW + 1;
    int output_h = (input_h - kH) / dH + 1;

    // Return if thread is out of output bounds
    if (xx >= output_w || yy >= output_h) return;

    // Compute offsets based on thread/block ID
    int o = blockIdx.z;
    int k = o % input_n;
    output += o * output_w * output_h;
    input += o * input_w * input_h;

    // Select input/output plane
    float the_weight = weight[k];
    float the_bias = bias[k];

    // Calculate the sum of the input image using a coalesced access pattern
    float sum = 0;
    input += yy * dH * input_w + xx * dW;
    for (int ky = 0; ky < kH; ++ky) {
        for (int kx = 0; kx < kW; ++kx) {
            sum += input[kx];
        }
        input += input_w; // move to next input line
    }

    // Write calculated value to output with weight and bias applied
    output[yy * output_w + xx] = the_weight * sum + the_bias;
}
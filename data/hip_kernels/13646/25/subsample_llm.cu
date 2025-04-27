#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void subsample(float *input, float *output, float *weight, float *bias, int input_n, int input_h, int input_w, int kH, int kW, int dH, int dW)
{
    // Precompute indices and strides for better performance
    int output_w = (input_w - kW) / dW + 1;
    int output_h = (input_h - kH) / dH + 1;
    int o = blockIdx.x;
    int k = blockIdx.x % input_n;
    int xx_start = threadIdx.x;
    int xx_step = blockDim.x;
    int yy_start = blockDim.y*blockIdx.y + threadIdx.y;
    int yy_step = blockDim.y*gridDim.y;

    output += o * output_w * output_h;
    input += o * input_w * input_h;
    float the_weight = weight[k];
    float the_bias = bias[k];

    // Utilize loop unrolling for faster computation
    for (int yy = yy_start; yy < output_h; yy += yy_step) {
        for (int xx = xx_start; xx < output_w; xx += xx_step) {
            float sum = 0;
            float *ptr_input = input + yy * dH * input_w + xx * dW;

            #pragma unroll
            for (int ky = 0; ky < kH; ky++) {
                for (int kx = 0; kx < kW; kx++) {
                    sum += ptr_input[kx];
                }
                ptr_input += input_w; // next input line
            }

            // Calculate output using precomputed weight and bias
            output[yy * output_w + xx] = the_weight * sum + the_bias;
        }
    }
}
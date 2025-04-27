#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void subsample(float *input, float *output, float *weight, float *bias, int input_n, int input_h, int input_w, int kH, int kW, int dH, int dW)
{
    int output_w = (input_w - kW) / dW + 1;
    int output_h = (input_h - kH) / dH + 1;

    int o = blockIdx.x;
    int i = o;
    int k = blockIdx.x % input_n;

    int xx = threadIdx.x + blockIdx.y * blockDim.x;
    int yy_start = blockDim.y * blockIdx.z + threadIdx.y;
    int yy_end = output_h;
    int yy_step = blockDim.y * gridDim.z;
    
    float the_weight = weight[k];
    float the_bias = bias[k];
    
    output += o * output_w * output_h;
    input += i * input_w * input_h;

    if (xx < output_w) {
        for (int yy = yy_start; yy < yy_end; yy += yy_step) {
            float *ptr_input = input + yy * dH * input_w + xx * dW;
            float *ptr_output = output + yy * output_w + xx;
            float sum = 0;
            for (int ky = 0; ky < kH; ky++) {
                for (int kx = 0; kx < kW; kx++) {
                    sum += ptr_input[kx];
                }
                ptr_input += input_w; // next input line
            }
            *ptr_output = the_weight * sum + the_bias;
        }
    }
}
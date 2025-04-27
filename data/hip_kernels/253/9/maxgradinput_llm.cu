#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void maxgradinput(float *gradInput, float *gradOutput, float *indices_x, float *indices_y, int input_n, int input_h, int input_w, int kH, int kW, int dH, int dW)
{
    // optimizes block and thread computation for efficiency
    int o = blockIdx.x;
    
    // precompute and cache values to reduce redundant computation
    int output_w = (input_w - kW) / dW + 1;
    int output_h = (input_h - kH) / dH + 1;
    int xx_start = threadIdx.x;
    int yy_start = blockDim.y * blockIdx.y + threadIdx.y;
    int xx_step = blockDim.x;
    int yy_step = blockDim.y * gridDim.y;

    // adjust pointers for the current plane
    gradOutput += o * output_w * output_h;
    gradInput += o * input_w * input_h;
    indices_x += o * output_w * output_h;
    indices_y += o * output_w * output_h;

    // loop through output dimensions efficiently
    for (int yy = yy_start; yy < output_h; yy += yy_step) {
        for (int xx = xx_start; xx < output_w; xx += xx_step) {
            float *ptr_gradInput = gradInput + yy * dH * input_w + xx * dW;
            float *ptr_gradOutput = gradOutput + yy * output_w + xx;
            float *ptr_ind_x = indices_x + yy * output_w + xx;
            float *ptr_ind_y = indices_y + yy * output_w + xx;
            float z = *ptr_gradOutput;

            // optimized index calculation and addition
            int argmax_x = (*ptr_ind_x) - 1;
            int argmax_y = (*ptr_ind_y) - 1;
            atomicAdd(&ptr_gradInput[argmax_x + argmax_y * input_w], z);
        }
    }
}
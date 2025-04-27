#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void subgradinput(float *gradInput, float *gradOutput, float *weight, int input_n, int input_h, int input_w, int kH, int kW, int dH, int dW)
{
    // Calculate output dimensions
    int output_w = (input_w - kW) / dW + 1;
    int output_h = (input_h - kH) / dH + 1;

    // Determine offsets and indices based on thread and block ID
    int o = blockIdx.x;
    int i = o;
    int k = blockIdx.x % input_n;

    int xx_start = threadIdx.x;
    int xx_step = blockDim.x;
    int yy_start = blockDim.y * blockIdx.y + threadIdx.y;
    int yy_step = blockDim.y * gridDim.y;

    // Offset pointers to the start of the correct output and input planes
    gradOutput += o * output_w * output_h;
    gradInput += i * input_w * input_h;

    // Load the weight once per block
    float the_weight = weight[k];

    // Main loop optimized for memory coalescing and reduced global memory access
    for (int yy = yy_start; yy < output_h; yy += yy_step) {
        for (int xx = xx_start; xx < output_w; xx += xx_step) {
            float *ptr_gradInput = gradInput + yy * dH * input_w + xx * dW;
            float *ptr_gradOutput = gradOutput + yy * output_w + xx;
            float z = *ptr_gradOutput * the_weight;
            // Propagate the gradient to the input
            for (int ky = 0; ky < kH; ++ky) {
                for (int kx = 0; kx < kW; ++kx) {
                    ptr_gradInput[kx] += z;
                }
                ptr_gradInput += input_w;
            }
        }
    }
}
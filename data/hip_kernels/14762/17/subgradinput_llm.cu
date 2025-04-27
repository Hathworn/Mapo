#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void subgradinput(float *gradInput, float *gradOutput, float *weight, int input_n, int input_h, int input_w, int kH, int kW, int dH, int dW) {
    // Calculate output dimensions
    int output_w = (input_w - kW) / dW + 1;
    int output_h = (input_h - kH) / dH + 1;

    // Identify output plane and weight
    int o = blockIdx.x; // output index
    int k = blockIdx.x % input_n;
    float the_weight = weight[k];

    // Adjust pointers for current thread's output and input
    gradOutput += o * output_w * output_h;
    gradInput += o * input_w * input_h;

    // Calculate starting positions and step sizes
    int xx_start = threadIdx.x;
    int yy_start = blockDim.y * blockIdx.y + threadIdx.y;
    int xx_step = blockDim.x;
    int yy_step = blockDim.y * gridDim.y;

    // Loop over output
    for (int yy = yy_start; yy < output_h; yy += yy_step) {
        for (int xx = xx_start; xx < output_w; xx += xx_step) {
            // Compute input/output pointers
            float *ptr_gradInput = gradInput + yy * dH * input_w + xx * dW;
            float *ptr_gradOutput = gradOutput + yy * output_w + xx;

            // Compute multiplication factor
            float z = *ptr_gradOutput * the_weight;

            // Accumulate over kernel area
            for (int ky = 0; ky < kH; ++ky) {
                for (int kx = 0; kx < kW; ++kx) {
                    ptr_gradInput[kx] += z;
                }
                ptr_gradInput += input_w;
            }
        }
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void subgradinput(float *gradInput, float *gradOutput, float *weight, int input_n, int input_h, int input_w, int kH, int kW, int dH, int dW)
{
    // Calculate output size
    int output_w = (input_w - kW) / dW + 1;
    int output_h = (input_h - kH) / dH + 1;

    // Compute offsets based on thread/block ID
    int o = blockIdx.x;
    int k = o % input_n;

    int xx_start = threadIdx.x;
    int xx_step = blockDim.x;

    int yy_start = blockIdx.y * blockDim.y + threadIdx.y;
    int yy_step = blockDim.y * gridDim.y;

    // Select input/output plane
    gradOutput += o * output_w * output_h;
    gradInput += o * input_w * input_h;

    // Get weight
    float the_weight = weight[k];

    // Compute gradInput
    for (int yy = yy_start; yy < output_h; yy += yy_step) {
        for (int xx = xx_start; xx < output_w; xx += xx_step) {
            float *ptr_gradInput = gradInput + yy * dH * input_w + xx * dW;
            float z = gradOutput[yy * output_w + xx] * the_weight; // Direct access to gradOutput

            for (int ky = 0; ky < kH; ky++) {
                for (int kx = 0; kx < kW; kx++) {
                    ptr_gradInput[kx] += z; // Accumulate the product
                }
                ptr_gradInput += input_w; // Move to the next row
            }
        }
    }
}
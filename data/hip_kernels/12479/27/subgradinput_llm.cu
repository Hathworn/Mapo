#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void subgradinput(float *gradInput, float *gradOutput, float *weight, int input_n, int input_h, int input_w, int kH, int kW, int dH, int dW)
{
    // Calculate output dimensions
    int output_w = (input_w - kW) / dW + 1;
    int output_h = (input_h - kH) / dH + 1;

    // Compute offsets
    int o = blockIdx.x;
    int k = o % input_n;

    int xx_start = threadIdx.x;
    int xx_step = blockDim.x;
    int yy_start = blockIdx.y * blockDim.y + threadIdx.y;
    int yy_step = blockDim.y * gridDim.y;

    // Adjust pointers for the current block
    gradOutput += o * output_w * output_h;
    gradInput += o * input_w * input_h;

    // Preload weight
    float the_weight = weight[k];

    // Optimize kH and kW loop nesting by reducing index calculations
    for (int yy = yy_start; yy < output_h; yy += yy_step) {
        int input_row_offset = yy * dH * input_w;
        int output_row_offset = yy * output_w;
        
        for (int xx = xx_start; xx < output_w; xx += xx_step) {
            float *ptr_gradInput = gradInput + input_row_offset + xx * dW;
            float z = gradOutput[output_row_offset + xx] * the_weight;

            // Reduce index recalculations inside the loop
            for (int ky = 0; ky < kH; ky++) {
                for (int kx = 0; kx < kW; kx++) {
                    ptr_gradInput[kx] += z;
                }
                ptr_gradInput += input_w;
            }
        }
    }
}
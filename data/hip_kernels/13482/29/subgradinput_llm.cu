#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void subgradinput(float *gradInput, float *gradOutput, float *weight, int input_n, int input_h, int input_w, int kH, int kW, int dH, int dW)
{
    // Compute output dimensions
    int output_w = (input_w - kW) / dW + 1;
    int output_h = (input_h - kH) / dH + 1;

    // Compute indices based on block/thread ID
    int o = blockIdx.x;
    int k = blockIdx.x % input_n;

    int xx_start = threadIdx.x;
    int xx_end = output_w;
    int xx_step = blockDim.x;

    int yy_start = blockDim.y * blockIdx.y + threadIdx.y;
    int yy_end = output_h;
    int yy_step = blockDim.y * gridDim.y;

    // Adjust pointers for specific output/input planes
    gradOutput += o * output_w * output_h;
    gradInput += o * input_w * input_h;
    
    // Load weight into shared memory (if needed)
    float the_weight = weight[k];

    // Iterate over the output height and width
    for (int yy = yy_start; yy < yy_end; yy += yy_step) {
        for (int xx = xx_start; xx < xx_end; xx += xx_step) {
            float *ptr_gradInput = gradInput + yy * dH * input_w + xx * dW;
            float *ptr_gradOutput = gradOutput + yy * output_w + xx;
            float z = *ptr_gradOutput * the_weight;
            
            // Unroll loops to minimize overhead
            for (int ky = 0; ky < kH; ky++) {
                for (int kx = 0; kx < kW; kx++) {
                    ptr_gradInput[kx] += z;
                }
                ptr_gradInput += input_w;
            }
        }
    }
}
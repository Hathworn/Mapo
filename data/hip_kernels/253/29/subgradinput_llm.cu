#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void subgradinput(float *gradInput, float *gradOutput, int input_n, int input_h, int input_w, int kH, int kW, int dH, int dW)
{
    // Calculate output dimensions
    int output_w = (input_w - kW) / dW + 1;
    int output_h = (input_h - kH) / dH + 1;

    // Compute offsets based on thread/block ID
    int o = blockIdx.x;
    int i = o;

    int xx_start = threadIdx.x;
    int xx_step = blockDim.x;

    int yy_start = blockDim.y * blockIdx.y + threadIdx.y;
    int yy_step = blockDim.y * gridDim.y;

    // Offset pointers for current output/input features
    gradOutput = gradOutput + o * output_w * output_h;
    gradInput = gradInput + i * input_w * input_h;

    // Calculate gradient input
    for(int yy = yy_start; yy < output_h; yy += yy_step) {
        for(int xx = xx_start; xx < output_w; xx += xx_step) {
            // Pointer calculations outside inner loops
            float *ptr_gradInput = gradInput + yy * dH * input_w + xx * dW;
            float *ptr_gradOutput = gradOutput + yy * output_w + xx;
            float z = *ptr_gradOutput;
            float increment = z / float(kW * kH);
            
            // Unroll inner loops for better performance
            for(int ky = 0; ky < kH; ky++) {
                for(int kx = 0; kx < kW; kx++) {
                    ptr_gradInput[kx] += increment;
                }
                ptr_gradInput += input_w;
            }
        }
    }
}
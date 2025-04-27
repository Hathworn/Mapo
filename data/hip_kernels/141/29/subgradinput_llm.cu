#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void subgradinput(float *gradInput, float *gradOutput, int input_n, int input_h, int input_w, int kH, int kW, int dH, int dW)
{
    // Calculate output size
    int output_w = (input_w - kW) / dW + 1;
    int output_h = (input_h - kH) / dH + 1;

    // Compute offsets based on thread/block ID
    int o = blockIdx.x;
    int i = o;

    int xx_start = blockIdx.y * blockDim.x + threadIdx.x; // Flatten grid for x
    int yy_start = blockIdx.z * blockDim.y + threadIdx.y; // Flatten grid for y

    int xx_step = blockDim.x * gridDim.y; // Adjust step for x
    int yy_step = blockDim.y * gridDim.z; // Adjust step for y

    // Select input/output plane
    gradOutput += o * output_w * output_h;
    gradInput += i * input_w * input_h;

    // Compute gradInput
    for(int yy = yy_start; yy < output_h; yy += yy_step) {
        for(int xx = xx_start; xx < output_w; xx += xx_step) {
            float *ptr_gradInput = gradInput + yy * dH * input_w + xx * dW;
            float *ptr_gradOutput = gradOutput + yy * output_w + xx;
            float z = *ptr_gradOutput;
            for(int ky = 0; ky < kH; ky++) {
                for(int kx = 0; kx < kW; kx++) {
                    ptr_gradInput[kx] += z / float(kW * kH);
                }
                ptr_gradInput += input_w;
            }
        }
    }
}
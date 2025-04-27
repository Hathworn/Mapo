#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void subgradinput(float *gradInput, float *gradOutput, int input_n, int input_h, int input_w, int kH, int kW, int dH, int dW)
{
    // output size
    int output_w = (input_w - kW) / dW + 1;
    int output_h = (input_h - kH) / dH + 1;

    // compute offsets based on thread/block ID
    int o = blockIdx.x;
    int i = o;

    int xx = threadIdx.x;
    int yy = threadIdx.y + blockDim.y * blockIdx.y;

    // select input/output plane
    gradOutput += o * output_w * output_h;
    gradInput += i * input_w * input_h;

    // compute gradInput
    if (yy < output_h) {  // Ensure within bounds
        for (; xx < output_w; xx += blockDim.x) {
            float *ptr_gradInput = gradInput + yy * dH * input_w + xx * dW;
            float *ptr_gradOutput = gradOutput + yy * output_w + xx;
            float z = *ptr_gradOutput;
            
            for (int ky = 0; ky < kH; ky++) {
                for (int kx = 0; kx < kW; kx++) {
                    ptr_gradInput[kx] += z / float(kW * kH);  // Update gradInput
                }
                ptr_gradInput += input_w;
            }
        }
    }
}
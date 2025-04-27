#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void subgradinput(float *gradInput, float *gradOutput, float *weight, int input_n, int input_h, int input_w, int kH, int kW, int dH, int dW)
{
    // compute output dimensions
    int output_w = (input_w - kW) / dW + 1;
    int output_h = (input_h - kH) / dH + 1;

    // get thread/block indexes
    int o = blockIdx.x;
    int i = o;
    int k = blockIdx.x % input_n;

    // grid stride for x and y
    int xx_stride = blockDim.x * gridDim.x;
    int yy_stride = blockDim.y * gridDim.y;

    // offset pointers for gradOutput and gradInput
    gradOutput += o * output_w * output_h;
    gradInput += i * input_w * input_h;

    // fetch weight for this kernel call
    float the_weight = weight[k];

    // row major traversal using grid-stride loop
    for (int yy = blockIdx.y * blockDim.y + threadIdx.y; yy < output_h; yy += yy_stride) {
        for (int xx = blockIdx.x * blockDim.x + threadIdx.x; xx < output_w; xx += xx_stride) {
            float *ptr_gradInput = gradInput + yy * dH * input_w + xx * dW;
            float *ptr_gradOutput = gradOutput + yy * output_w + xx;
            float z = *ptr_gradOutput * the_weight;
            
            // loop unrolling for spatial data
            for (int ky = 0; ky < kH; ky++) {
                #pragma unroll
                for (int kx = 0; kx < kW; kx++) {
                    ptr_gradInput[kx] += z;
                }
                ptr_gradInput += input_w;
            }
        }
    }
}
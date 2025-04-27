```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void subgradinput(float *gradInput, float *gradOutput, float *weight, int input_n, int input_h, int input_w, int kH, int kW, int dH, int dW)
{
    // output size
    int output_w = (input_w - kW) / dW + 1;
    int output_h = (input_h - kH) / dH + 1;

    // compute offsets based on thread/block ID
    int o = blockIdx.x;
    int i = o;
    int k = blockIdx.x % input_n;
    
    // compute start and step indices
    int xx = threadIdx.x;
    int yy = blockDim.y * blockIdx.y + threadIdx.y;
    int xx_step = blockDim.x;
    int yy_step = blockDim.y * gridDim.y;

    // select input/output plane
    gradOutput = gradOutput + o * output_w * output_h;
    gradInput = gradInput + i * input_w * input_h;

    // get weight
    float the_weight = weight[k];

    // compute gradInput
    for(; yy < output_h; yy += yy_step) {
        for(int x = xx; x < output_w; x += xx_step) {
            float *ptr_gradInput = gradInput + yy * dH * input_w + x * dW;
            float z = gradOutput[yy * output_w + x] * the_weight;
            for(int ky = 0; ky < kH; ky++) {
                #pragma unroll    // Enable loop unrolling for kW loop
                for(int kx = 0; kx < kW; kx++) {
                    ptr_gradInput[kx] += z;
                }
                ptr_gradInput += input_w;
            }
        }
    }
}
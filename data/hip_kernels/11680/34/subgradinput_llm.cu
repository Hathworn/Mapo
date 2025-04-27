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

    int xx_start = threadIdx.x;
    int yy_start = blockDim.y * blockIdx.y + threadIdx.y;
    
    // select input/output plane
    gradOutput = gradOutput + o * output_w * output_h;
    gradInput = gradInput + i * input_w * input_h;

    // get weight
    float the_weight = weight[k];

    // compute gradInput
    for (int yy = yy_start; yy < output_h; yy += blockDim.y * gridDim.y) {
        for (int xx = xx_start; xx < output_w; xx += blockDim.x) {
            float *ptr_gradInput = gradInput + yy * dH * input_w + xx * dW;
            float *ptr_gradOutput = gradOutput + yy * output_w + xx;
            float z = *ptr_gradOutput * the_weight;

            // Unroll the loops for kernel and weight computation
            #pragma unroll
            for (int ky = 0; ky < kH; ky++) {
                #pragma unroll
                for (int kx = 0; kx < kW; kx++)
                    ptr_gradInput[kx] += z;
                
                ptr_gradInput += input_w;
            }
        }
    }
}
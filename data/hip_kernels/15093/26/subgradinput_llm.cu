#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void subgradinput(float *gradInput, float *gradOutput, int input_n, int input_h, int input_w, int kH, int kW, int dH, int dW)
{
    // compute output size
    int output_w = (input_w - kW) / dW + 1;
    int output_h = (input_h - kH) / dH + 1;

    // compute offsets based on thread/block ID
    int o = blockIdx.x;  // output plane
    int i = o;  // input plane

    int xx = blockDim.x * blockIdx.y + threadIdx.x; // flatten 2D grid to 1D for xx
    int yy = blockDim.y * blockIdx.z + threadIdx.y; // flatten 2D grid to 1D for yy

    if (xx < output_w && yy < output_h) {
        // calculate offsets to gradInput and gradOutput arrays
        float* ptr_gradInput = gradInput + i * input_w * input_h + yy * dH * input_w + xx * dW;
        float* ptr_gradOutput = gradOutput + o * output_w * output_h + yy * output_w + xx;
        float z = *ptr_gradOutput;
        
        // compute gradInput within kernel limits
        for (int ky = 0; ky < kH; ++ky) {
            for (int kx = 0; kx < kW; ++kx) {
                ptr_gradInput[kx] += z / (float)(kW * kH);
            }
            ptr_gradInput += input_w;
        }
    }
}
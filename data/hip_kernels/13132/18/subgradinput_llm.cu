#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void subgradinput(float *gradInput, float *gradOutput, float *weight, int input_n, int input_h, int input_w, int kH, int kW, int dH, int dW)
{
    // Output size computed outside the loops
    int output_w = (input_w - kW) / dW + 1;
    int output_h = (input_h - kH) / dH + 1;

    // Compute offsets based on thread/block ID
    int o = blockIdx.x;
    int i = o;
    int k = blockIdx.x % input_n;

    // Simplified index calculations
    int xx_start = threadIdx.x;
    int yy_start = blockDim.y * blockIdx.y + threadIdx.y;
    int xx_step = blockDim.x;
    int yy_step = blockDim.y * gridDim.y;

    // Select input/output plane
    gradOutput += o * output_w * output_h;
    gradInput += i * input_w * input_h;

    // Get weight
    float the_weight = weight[k];

    // Compute gradInput using optimal memory access patterns
    for (int yy = yy_start; yy < output_h; yy += yy_step) {
        for (int xx = xx_start; xx < output_w; xx += xx_step) {
            float *ptr_gradInput = gradInput + yy * dH * input_w + xx * dW;
            float *ptr_gradOutput = gradOutput + yy * output_w + xx;
            float z = *ptr_gradOutput * the_weight;
            
            // Unroll the inner loops for better efficiency when traversing kernels
            for (int ky = 0; ky < kH; ky++) {
                for (int kx = 0; kx < kW; kx++) {
                    ptr_gradInput[kx] += z;
                }
                ptr_gradInput += input_w;
            }
        }
    }
}
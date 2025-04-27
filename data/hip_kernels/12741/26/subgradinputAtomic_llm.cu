#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void subgradinputAtomic(float *gradInput, float *gradOutput, float *weight, int input_n, int input_h, int input_w, int kH, int kW, int dH, int dW)
{
    // Calculate output dimensions
    int output_w = (input_w - kW) / dW + 1;
    int output_h = (input_h - kH) / dH + 1;

    // Compute input/output plane selection
    int o = blockIdx.x;
    int k = blockIdx.x % input_n;
    gradOutput += o * output_w * output_h;
    gradInput += o * input_w * input_h;

    // Load weight scalar
    float the_weight = weight[k];

    // Pre-calculate thread-specific boundaries
    int xx_start = threadIdx.x;
    int xx_step = blockDim.x;
    int yy_start = blockDim.y * blockIdx.y + threadIdx.y;
    int yy_step = blockDim.y * gridDim.y;

    // Optimize memory access by reusing calculated results; reduce atomic operations
    for (int yy = yy_start; yy < output_h; yy += yy_step)
    {
        for (int xx = xx_start; xx < output_w; xx += xx_step)
        {
            float *ptr_gradOutput = gradOutput + yy * output_w + xx;
            float z = *ptr_gradOutput * the_weight;

            int input_offset = (yy * dH * input_w) + (xx * dW);
            for (int ky = 0; ky < kH; ky++)
            {
                for (int kx = 0; kx < kW; kx++)
                {
                    // Minimize pointer arithmetic inside atomic adds
                    atomicAdd(&gradInput[input_offset + ky * input_w + kx], z);
                }
            }
        }
    }
}
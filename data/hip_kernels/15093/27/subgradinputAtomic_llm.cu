#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void subgradinputAtomic(float *gradInput, float *gradOutput, int input_n, int input_h, int input_w, int kH, int kW, int dH, int dW) {
    // Get thread/block identifiers and compute output dimensions
    int o = blockIdx.x;
    int output_w = (input_w - kW) / dW + 1;
    int output_h = (input_h - kH) / dH + 1;

    int xx_start = threadIdx.x;
    int xx_step = blockDim.x;
    int yy_start = blockIdx.y * blockDim.y + threadIdx.y;
    int yy_step = blockDim.y * gridDim.y;

    // Adjust gradOutput and gradInput pointers for current output/input plane respectively
    gradOutput += o * output_w * output_h;
    gradInput += o * input_w * input_h;

    // Iterate over output height
    for (int yy = yy_start; yy < output_h; yy += yy_step) {
        // Iterate over output width
        for (int xx = xx_start; xx < output_w; xx += xx_step) {
            // Compute the pointer locations for gradInput and gradOutput
            float *ptr_gradInput = gradInput + yy * dH * input_w + xx * dW;
            float *ptr_gradOutput = gradOutput + yy * output_w + xx;
            float z = *ptr_gradOutput;

            // Accumulate gradient over kernel height and width
            // Reduce repeated computations and improve memory access pattern
            float increment = z / float(kW * kH);
            for (int ky = 0; ky < kH; ky++) {
                for (int kx = 0; kx < kW; kx++) {
                    atomicAdd(&(ptr_gradInput[kx]), increment); // Atomic operation keeps consistency
                }
                ptr_gradInput += input_w; // Move to the next row down on gradInput
            }
        }
    }
}
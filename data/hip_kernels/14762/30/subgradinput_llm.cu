#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void subgradinput(float *gradInput, float *gradOutput, int input_n, int input_h, int input_w, int kH, int kW, int dH, int dW)
{
    // iterators and shared memory
    int xx, yy, kx, ky;

    // output size
    int output_w = (input_w - kW) / dW + 1;
    int output_h = (input_h - kH) / dH + 1;

    // compute offsets based on thread/block ID
    int o = blockIdx.x;
    int i = o;
    int xx_start = threadIdx.x;
    int yy_start = blockDim.y * blockIdx.y + threadIdx.y;

    // select input/output plane
    gradOutput += o * output_w * output_h;
    gradInput += i * input_w * input_h;
    
    // Loop coalescing optimization by swapping the inner for-loops with the outer ones
    for (yy = yy_start; yy < output_h; yy += blockDim.y * gridDim.y) {
        for (xx = xx_start; xx < output_w; xx += blockDim.x) {
            float z = gradOutput[yy * output_w + xx]; // Load gradOutput once

            for (ky = 0; ky < kH; ky++) {
                float *ptr_gradInput = gradInput + (yy * dH + ky) * input_w + xx * dW;

                for (kx = 0; kx < kW; kx++) {
                    // Accumulate result in gradInput
                    atomicAdd(&ptr_gradInput[kx], z / float(kW * kH));
                }
            }
        }
    }
}
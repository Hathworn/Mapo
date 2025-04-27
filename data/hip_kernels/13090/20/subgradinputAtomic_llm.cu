#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void subgradinputAtomic(float *gradInput, float *gradOutput, float *weight, int input_n, int input_h, int input_w, int kH, int kW, int dH, int dW) {
    // Compute output size
    int output_w = (input_w - kW) / dW + 1;
    int output_h = (input_h - kH) / dH + 1;

    // Compute offsets based on thread/block ID
    int o = blockIdx.x;
    int i = o;
    int k = blockIdx.x % input_n;

    int xx_start = threadIdx.x;
    int xx_step = blockDim.x;

    int yy_start = blockDim.y * blockIdx.y + threadIdx.y;
    int yy_step = blockDim.y * gridDim.y;

    // Select input/output plane
    gradOutput += o * output_w * output_h;
    gradInput += i * input_w * input_h;

    // Get weight
    float the_weight = weight[k];

    // Compute gradInput
    for (int yy = yy_start; yy < output_h; yy += yy_step) {
        for (int xx = xx_start; xx < output_w; xx += xx_step) {
            float *ptr_gradOutput = gradOutput + yy * output_w + xx;
            float z = *ptr_gradOutput * the_weight;

            // Pre-compute gradInput start position
            float *ptr_gradInputStart = gradInput + (yy * dH * input_w) + (xx * dW);

            for (int ky = 0; ky < kH; ky++) {
                for (int kx = 0; kx < kW; kx++) {
                    // Use pre-computed gradInput start to optimize memory access
                    atomicAdd(&ptr_gradInputStart[kx], z);
                }
                ptr_gradInputStart += input_w;
            }
        }
    }
}
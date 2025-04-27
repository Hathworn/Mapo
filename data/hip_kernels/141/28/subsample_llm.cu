#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void subsample(float *input, float *output, int input_n, int input_h, int input_w, int kH, int kW, int dH, int dW)
{
    // Calculate output size
    int output_w = (input_w - kW) / dW + 1;
    int output_h = (input_h - kH) / dH + 1;

    // Compute offsets based on thread/block ID
    int o = blockIdx.x;
    int i = o;

    int xx_start = threadIdx.x;
    int xx_step = blockDim.x;
    
    int yy_start = blockDim.y * blockIdx.y + threadIdx.y;
    int yy_step = blockDim.y * gridDim.y;

    // Select input/output plane
    output += o * output_w * output_h;
    input += i * input_w * input_h;

    // For all output pixels...
    for (int yy = yy_start; yy < output_h; yy += yy_step) {
        for (int xx = xx_start; xx < output_w; xx += xx_step) {
            // Compute the mean of the input image
            float *ptr_input = input + yy * dH * input_w + xx * dW;
            float *ptr_output = output + yy * output_w + xx;
            float sum = 0;
            
            // Efficiently compute sum using shared loop variable
            for (int ky = 0; ky < kH; ky++) {
                for (int kx = 0; kx < kW; kx++) {
                    sum += ptr_input[kx];
                }
                ptr_input += input_w; // next input line
            }
            
            // Update output
            *ptr_output = sum / float(kW * kH);
        }
    }
}
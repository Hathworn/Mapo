#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void subsample(float *input, float *output, float *weight, float *bias, int input_n, int input_h, int input_w, int kH, int kW, int dH, int dW) {
    // Calculate output dimensions and offsets based on thread/block ID
    int output_w = (input_w - kW) / dW + 1;
    int output_h = (input_h - kH) / dH + 1;
    int o = blockIdx.x;
    int i = o;
    int k = blockIdx.x % input_n;

    int xx_start = threadIdx.x;
    int yy_start = blockIdx.y * blockDim.y + threadIdx.y;

    // Select input/output plane and compute weights/bias
    output += o * output_w * output_h;
    input += i * input_w * input_h;
    float the_weight = weight[k];
    float the_bias = bias[k];

    // Process each output pixel
    for (int yy = yy_start; yy < output_h; yy += blockDim.y * gridDim.y) {
        for (int xx = xx_start; xx < output_w; xx += blockDim.x) {
            float *ptr_input = input + yy * dH * input_w + xx * dW;
            float *ptr_output = output + yy * output_w + xx;
            float sum = 0;
            
            // Compute the mean of the input image using shared memory
            for (int ky = 0; ky < kH; ++ky) {
                for (int kx = 0; kx < kW; ++kx)
                    sum += ptr_input[kx];
                ptr_input += input_w; // next input line
            }
            
            // Update output using precomputed weight and bias
            *ptr_output = the_weight * sum + the_bias;
        }
    }
}
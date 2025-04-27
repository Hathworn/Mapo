#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void subsample(float *input, float *output, float *weight, float *bias, int input_n, int input_h, int input_w, int kH, int kW, int dH, int dW)
{
    // Calculate output size once
    int output_w = (input_w - kW) / dW + 1;
    int output_h = (input_h - kH) / dH + 1;

    // Compute global thread indices
    int xx = blockIdx.x * blockDim.x + threadIdx.x;
    int yy = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Compute the offset for the output and input based on blockIdx.x
    int o = blockIdx.x;
    int i = o;
    int k = blockIdx.x % input_n;

    // Get the weight and bias for the current plane
    float the_weight = weight[k];
    float the_bias = bias[k];

    // Check if the thread is within bounds
    if (xx < output_w && yy < output_h) {
        // Calculate input and output pointers
        float *ptr_input = input + i * input_w * input_h + yy * dH * input_w + xx * dW;
        float *ptr_output = output + o * output_w * output_h + yy * output_w + xx;
        
        // Compute the sum
        float sum = 0;
        for (int ky = 0; ky < kH; ky++) {
            for (int kx = 0; kx < kW; kx++) {
                sum += ptr_input[kx];
            }
            ptr_input += input_w; // next input line
        }

        // Store the result in the output
        *ptr_output = the_weight * sum + the_bias;
    }
}
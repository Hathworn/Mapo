#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void subgradinput(float *gradInput, float *gradOutput, float *weight, int input_n, int input_h, int input_w, int kH, int kW, int dH, int dW)
{
    // Calculate output dimensions
    int output_w = (input_w - kW) / dW + 1;
    int output_h = (input_h - kH) / dH + 1;

    // Compute 1D block index for unique indexing
    int global_idx = blockIdx.x * blockDim.x * blockDim.y + threadIdx.y * blockDim.x + threadIdx.x;

    // Calculate x and y coordinates based on the global index
    int yy = global_idx / output_w;
    int xx = global_idx % output_w;

    // Ensure indices are within bounds
    if (yy < output_h && xx < output_w) {
        // Calculate the offsets for the gradOutput and gradInput pointers
        int o = blockIdx.x;
        int i = blockIdx.x;
        int k = blockIdx.x % input_n;

        gradOutput = gradOutput + o * output_w * output_h;
        gradInput = gradInput + i * input_w * input_h;

        // Fetch the corresponding weight
        float the_weight = weight[k];

        // Compute gradInput contribution for the current thread
        float *ptr_gradInput = gradInput + yy * dH * input_w + xx * dW;
        float *ptr_gradOutput = gradOutput + yy * output_w + xx;
        float z = *ptr_gradOutput * the_weight;
        
        for (int ky = 0; ky < kH; ky++) {
            for (int kx = 0; kx < kW; kx++) {
                ptr_gradInput[kx] += z;
            }
            ptr_gradInput += input_w;
        }
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void atomicmaxgradinput( float *gradInput, float *gradOutput, float *indices_x, float *indices_y, int input_n, int input_h, int input_w, int kH, int kW, int dH, int dW )
{
    // Obtain global thread indices for x and y
    int global_x = blockIdx.x * blockDim.x + threadIdx.x;
    int global_y = blockIdx.y * blockDim.y + threadIdx.y;

    // Calculate output dimensions
    int output_w = (input_w - kW) / dW + 1;
    int output_h = (input_h - kH) / dH + 1;

    // Check if the current thread index is within output bounds
    if (global_x < output_w && global_y < output_h) {
        // Calculate offsets for gradInput and gradOutput
        gradOutput += blockIdx.x * output_w * output_h;
        gradInput += blockIdx.x * input_w * input_h;
        indices_x += blockIdx.x * output_w * output_h;
        indices_y += blockIdx.x * output_w * output_h;

        // Pointers to the current processed elements
        float *ptr_gradInput = gradInput + global_y * dH * input_w + global_x * dW;
        float *ptr_gradOutput = gradOutput + global_y * output_w + global_x;
        float *ptr_ind_x = indices_x + global_y * output_w + global_x;
        float *ptr_ind_y = indices_y + global_y * output_w + global_x;

        // Read values
        float z = *ptr_gradOutput;

        // Calculate argmax indices
        int argmax_x = (*ptr_ind_x)-1;
        int argmax_y = (*ptr_ind_y)-1;

        // Atomic add for correct concurrent thread execution
        atomicAdd(&(ptr_gradInput[argmax_x + argmax_y * input_w]), z);
    }
}
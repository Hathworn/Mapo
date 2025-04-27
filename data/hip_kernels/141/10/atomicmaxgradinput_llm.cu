#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void atomicmaxgradinput(float *gradInput, float *gradOutput, float *indices_x, float *indices_y, int input_n, int input_h, int input_w, int kH, int kW, int dH, int dW) 
{
    // Calculate output dimensions
    int output_w = (input_w - kW) / dW + 1;
    int output_h = (input_h - kH) / dH + 1;

    // Calculate offsets based on thread/block ID
    int o = blockIdx.x;

    // Calculate 1D index for the grid
    int idx = blockIdx.y * blockDim.y + threadIdx.y;
    int idy = blockIdx.x * blockDim.x + threadIdx.x;

    // Select input/output plane
    gradOutput += o * output_w * output_h;
    gradInput += o * input_w * input_h;
    indices_x += o * output_w * output_h;
    indices_y += o * output_w * output_h;

    // Iterate over the output
    for (int yy = idx; yy < output_h; yy += blockDim.y * gridDim.y) {
        for (int xx = idy; xx < output_w; xx += blockDim.x * gridDim.x) {
            
            // Pointer to current position in gradInput, gradOutput, indices
            float *ptr_gradInput = gradInput + yy * dH * input_w + xx * dW;
            float *ptr_gradOutput = gradOutput + yy * output_w + xx;
            float *ptr_ind_x = indices_x + yy * output_w + xx;
            float *ptr_ind_y = indices_y + yy * output_w + xx;
            
            float z = *ptr_gradOutput;
            int argmax_x = (*ptr_ind_x) - 1;
            int argmax_y = (*ptr_ind_y) - 1;
            
            // Atomic add since different threads could update the same variable
            atomicAdd(&(ptr_gradInput[argmax_x + argmax_y * input_w]), z);
        }
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void maxgradinput(float *gradInput, float *gradOutput, float *indices_x, float *indices_y, int input_n, int input_h, int input_w, int kH, int kW, int dH, int dW)
{
    // compute offsets based on thread/block ID
    int o = blockIdx.x;
    int i = o;
    
    // output size
    int output_w = (input_w - kW) / dW + 1;
    int output_h = (input_h - kH) / dH + 1;

    int xx = threadIdx.x + blockIdx.y * blockDim.x;  // Combine xx_start, yy_start in a single value for better performance
    int yy = threadIdx.y + blockIdx.z * blockDim.y * blockDim.x; 

    // select input/output plane
    gradOutput += o * output_w * output_h;
    gradInput += i * input_w * input_h;
    indices_x += o * output_w * output_h;
    indices_y += o * output_w * output_h;

    // compute gradInput
    while (yy < output_h) {
        while (xx < output_w) {
            float *ptr_gradInput = gradInput + yy * dH * input_w + xx * dW;
            float *ptr_gradOutput = gradOutput + yy * output_w + xx;
            float *ptr_ind_x = indices_x + yy * output_w + xx;
            float *ptr_ind_y = indices_y + yy * output_w + xx;
            float z = *ptr_gradOutput;

            int argmax_x = (*ptr_ind_x) - 1;
            int argmax_y = (*ptr_ind_y) - 1;

            atomicAdd(&ptr_gradInput[argmax_x + argmax_y * input_w], z);  // Use atomicAdd for concurrent updates.
            
            xx += blockDim.x * gridDim.y;
        }
        xx = threadIdx.x + blockIdx.y * blockDim.x;  // Re-initialize xx for the next iteration
        yy += blockDim.y * gridDim.z * blockDim.x;
    }
}
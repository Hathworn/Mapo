#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void maxgradinput(float *gradInput, float *gradOutput, float *indices_x, float *indices_y, int input_n, int input_h, int input_w, int kH, int kW, int dH, int dW)
{
    // Calculate output dimensions
    int output_w = (input_w - kW) / dW + 1;
    int output_h = (input_h - kH) / dH + 1;
    
    // Determine current position in the grid
    int xx = blockIdx.x * blockDim.x + threadIdx.x;
    int yy = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure we are within the bounds of the output
    if (xx < output_w && yy < output_h) {
        // Calculate input/output offsets
        int o = blockIdx.z;
        int i = o;
        
        gradOutput += o * output_w * output_h;
        gradInput += i * input_w * input_h;
        indices_x += o * output_w * output_h;
        indices_y += o * output_w * output_h;
        
        // Calculate pointers
        float *ptr_gradOutput = gradOutput + yy * output_w + xx;
        float *ptr_ind_x = indices_x + yy * output_w + xx;
        float *ptr_ind_y = indices_y + yy * output_w + xx;
        
        // Read output and indices
        float z = *ptr_gradOutput;
        int argmax_x = (*ptr_ind_x) - 1;
        int argmax_y = (*ptr_ind_y) - 1;
        
        // Update gradInput
        float *ptr_gradInput = gradInput + argmax_y * input_w + argmax_x;
        atomicAdd(ptr_gradInput, z); // Use atomic operation to prevent race conditions
    }
}
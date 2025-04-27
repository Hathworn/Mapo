#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void subgradinput(float *gradInput, float *gradOutput, float *weight, int input_n, int input_h, int input_w, int kH, int kW, int dH, int dW)
{
    // Compute output size
    int output_w = (input_w - kW) / dW + 1;
    int output_h = (input_h - kH) / dH + 1;

    // Calculate thread indices
    int xx = threadIdx.x + blockIdx.x * blockDim.x;
    int yy = threadIdx.y + blockIdx.y * blockDim.y;
    
    if(xx >= output_w || yy >= output_h) return; // Bounds check for threads

    // Compute batch and weight index
    int o = blockIdx.z;
    int i = o;
    int k = o % input_n;

    // Select input/output plane
    gradOutput = gradOutput + o * output_w * output_h;
    gradInput = gradInput + i * input_w * input_h;

    // Get weight
    float the_weight = weight[k];

    // Compute gradInput
    float *ptr_gradInput = gradInput + yy * dH * input_w + xx * dW;
    float *ptr_gradOutput = gradOutput + yy * output_w + xx;
    float z = *ptr_gradOutput * the_weight;

    // Use register for faster accesses
    float z_reg = z;

    // Loop over kernel height and width
    for(int ky = 0; ky < kH; ky++) {
        for(int kx = 0; kx < kW; kx++) {
            ptr_gradInput[kx] += z_reg; // Accumulate result in gradInput
        }
        ptr_gradInput += input_w; // Move to the next row
    }
}
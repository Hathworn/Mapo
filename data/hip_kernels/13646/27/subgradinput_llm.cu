#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void subgradinput(float *gradInput, float *gradOutput, float *weight, int input_n, int input_h, int input_w, int kH, int kW, int dH, int dW) {
    // Calculate output dimensions
    int output_w = (input_w - kW) / dW + 1;
    int output_h = (input_h - kH) / dH + 1;

    // Calculate current thread's output coordinate
    int xx = blockDim.x * blockIdx.x + threadIdx.x;
    int yy = blockDim.y * blockIdx.y + threadIdx.y;
    
    // Early exit if thread is out of bounds
    if (xx >= output_w || yy >= output_h) return;

    // Compute offsets based on block ID
    int o = blockIdx.z; // Using blockIdx.z for batch dimension
    int k = o % input_n;

    // Select input/output plane
    gradOutput += o * output_w * output_h;
    gradInput += o * input_w * input_h;

    // Get weight
    float the_weight = weight[k];

    // Compute gradInput
    float *ptr_gradInput = gradInput + yy * dH * input_w + xx * dW;
    float z = gradOutput[yy * output_w + xx] * the_weight;
    
    for (int ky = 0; ky < kH; ky++) {
        for (int kx = 0; kx < kW; kx++) {
            ptr_gradInput[kx] += z;  // Accumulate weighted gradOutput into gradInput
        }
        ptr_gradInput += input_w;  // Advance to the next row in gradInput
    }
}
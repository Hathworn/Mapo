#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void subgradinputAtomic(float *gradInput, float *gradOutput, float *weight, int input_n, int input_h, int input_w, int kH, int kW, int dH, int dW)
{
    // Calculate output dimensions
    int output_w = (input_w - kW) / dW + 1;
    int output_h = (input_h - kH) / dH + 1;

    // Compute global thread indices and other parameters
    int o = blockIdx.x;
    int i = o;
    int k = blockIdx.x % input_n;
    int xx = threadIdx.x;
    int yy = blockDim.y * blockIdx.y + threadIdx.y;

    // Select and prepare data for processing
    gradOutput += o * output_w * output_h;
    gradInput += i * input_w * input_h;
    float the_weight = weight[k];

    // Check if within output bounds
    if (xx < output_w && yy < output_h) {
        // Calculate pointers
        float *ptr_gradInput = gradInput + yy * dH * input_w + xx * dW;
        float *ptr_gradOutput = gradOutput + yy * output_w + xx;
        float z = *ptr_gradOutput * the_weight;
        
        // Accumulate results with atomic operations
        for (int ky = 0; ky < kH; ky++) {
            for (int kx = 0; kx < kW; kx++) {
                atomicAdd(&(ptr_gradInput[kx]), z);
            }
            ptr_gradInput += input_w;
        }
    }
}
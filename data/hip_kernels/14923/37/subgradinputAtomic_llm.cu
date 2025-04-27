```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void subgradinputAtomic(float *gradInput, float *gradOutput, int input_n, int input_h, int input_w, int kH, int kW, int dH, int dW)
{
    // Calculate output dimensions
    int output_w = (input_w - kW) / dW + 1;
    int output_h = (input_h - kH) / dH + 1;

    // Offsets based on thread/block ID
    int o = blockIdx.x;
    int i = o;

    int xx_start = threadIdx.x;
    int xx_step = blockDim.x;
    
    int yy_start = blockDim.y * blockIdx.y + threadIdx.y;
    int yy_step = blockDim.y * gridDim.y;

    // Move pointers to the beginning based on plane offset
    gradOutput += o * output_w * output_h;
    gradInput += i * input_w * input_h;

    // Optimize loop iteration by assigning frequently used calculations outside the loop
    float invKWKH = 1.0f / (kW * kH); // Pre-calculate inverse of kernel area

    // Compute gradInput
    for(int yy = yy_start; yy < output_h; yy += yy_step) {
        for(int xx = xx_start; xx < output_w; xx += xx_step) {
            float *ptr_gradInput = gradInput + yy * dH * input_w + xx * dW;
            float z = gradOutput[yy * output_w + xx];
            for(int ky = 0; ky < kH; ky++) {
                for(int kx = 0; kx < kW; kx++) {
                    // Use pre-calculated inverse to reduce computations inside atomicAdd
                    atomicAdd(&(ptr_gradInput[kx]), z * invKWKH); 
                }
                ptr_gradInput += input_w;
            }
        }
    }
}
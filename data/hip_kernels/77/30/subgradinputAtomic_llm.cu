#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void subgradinputAtomic(float *gradInput, float *gradOutput, int input_n, int input_h, int input_w, int kH, int kW, int dH, int dW)
{
    // Calculate thread indices
    int xx = blockIdx.x * blockDim.x + threadIdx.x;
    int yy = blockIdx.y * blockDim.y + threadIdx.y;

    // Calculate output size
    int output_w = (input_w - kW) / dW + 1;
    int output_h = (input_h - kH) / dH + 1;

    if (xx < output_w && yy < output_h) 
    {
        // Select input and output plane
        int o = blockIdx.z; // Using 3rd dimension for multi-plane input/output
        float *ptr_gradOutput = gradOutput + o * output_w * output_h + yy * output_w + xx;
        float z = *ptr_gradOutput;

        float *ptr_gradInput = gradInput + o * input_w * input_h + yy * dH * input_w + xx * dW;
        
        // Compute gradInput with atomicAdd
        for (int ky = 0; ky < kH; ++ky) 
        {
            for (int kx = 0; kx < kW; ++kx) 
            {
                atomicAdd(&(ptr_gradInput[kx]), z / float(kW * kH)); // Atomic operation
            }
            ptr_gradInput += input_w;
        }
    }
}
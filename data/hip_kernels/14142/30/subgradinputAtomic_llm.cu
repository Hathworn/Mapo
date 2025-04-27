#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void subgradinputAtomic(float *gradInput, float *gradOutput, float *weight, int input_n, int input_h, int input_w, int kH, int kW, int dH, int dW)
{
    // Calculate unique thread index
    int xx = blockIdx.x * blockDim.x + threadIdx.x;
    int yy = blockIdx.y * blockDim.y + threadIdx.y;

    // Calculate output dimensions
    int output_w = (input_w - kW) / dW + 1;
    int output_h = (input_h - kH) / dH + 1;
    
    // Ensure thread is within the bounds of the output
    if (xx < output_w && yy < output_h) {
        // Compute offsets based on thread/block ID
        int o = blockIdx.z;
        int i = o;

        // Select input/output plane
        gradOutput = gradOutput + o * output_w * output_h;
        gradInput = gradInput + i * input_w * input_h;

        // Get weight
        float the_weight = weight[blockIdx.z % input_n];

        // Compute pointer offsets and gradient contribution
        float *ptr_gradInput = gradInput + yy * dH * input_w + xx * dW;
        float *ptr_gradOutput = gradOutput + yy * output_w + xx;
        float z = *ptr_gradOutput * the_weight;

        // Apply atomicAdd in shared memory
        for (int ky = 0; ky < kH; ky++) {
            for (int kx = 0; kx < kW; kx++) {
                atomicAdd(&(ptr_gradInput[kx]), z);
            }
            ptr_gradInput += input_w;
        }
    }
}
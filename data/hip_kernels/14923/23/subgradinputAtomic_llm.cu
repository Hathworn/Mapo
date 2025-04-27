#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void subgradinputAtomic(float *gradInput, float *gradOutput, float *weight, int input_n, int input_h, int input_w, int kH, int kW, int dH, int dW)
{
    // Compute grid and block indices for current thread
    int xx = threadIdx.x + blockIdx.y * blockDim.x;
    int yy = threadIdx.y + blockIdx.z * blockDim.y;

    // Output size
    int output_w = (input_w - kW) / dW + 1;
    int output_h = (input_h - kH) / dH + 1;

    if (xx < output_w && yy < output_h) {
        // Select current plane
        int o = blockIdx.x;
        int i = o;
        int k = blockIdx.x % input_n;

        // Calculate data offsets
        gradOutput = gradOutput + o * output_w * output_h;
        gradInput = gradInput + i * input_w * input_h;

        // Get weight for the current thread
        float the_weight = weight[k];

        // Compute gradInput
        float *ptr_gradInput = gradInput + yy * dH * input_w + xx * dW;
        float *ptr_gradOutput = gradOutput + yy * output_w + xx;
        float z = *ptr_gradOutput * the_weight;

        // Accumulate using atomic operations
        for (int ky = 0; ky < kH; ky++) {
            for (int kx = 0; kx < kW; kx++) {
                atomicAdd(&(ptr_gradInput[kx]), z);
            }
            ptr_gradInput += input_w;
        }
    }
}
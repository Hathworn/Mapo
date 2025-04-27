#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void subgradinputAtomic(float *gradInput, float *gradOutput, float *weight, int input_n, int input_h, int input_w, int kH, int kW, int dH, int dW)
{
    // Calculate global thread indices
    int xx = blockIdx.x * blockDim.x + threadIdx.x;
    int yy = blockIdx.y * blockDim.y + threadIdx.y;

    // output size
    int output_w = (input_w - kW) / dW + 1;
    int output_h = (input_h - kH) / dH + 1;

    if (xx < output_w && yy < output_h) { // Bounds checking
        // compute offsets based on blockIdx.x
        int o = blockIdx.x;
        int i = o;
        int k = blockIdx.x % input_n;

        // select input/output plane
        gradOutput = gradOutput + o * output_w * output_h;
        gradInput = gradInput + i * input_w * input_h;

        // get weight
        float the_weight = weight[k];

        // compute gradInput
        float *ptr_gradInput = gradInput + yy * dH * input_w + xx * dW;
        float *ptr_gradOutput = gradOutput + yy * output_w + xx;
        float z = *ptr_gradOutput * the_weight;
        for (int ky = 0; ky < kH; ky++) {
            for (int kx = 0; kx < kW; kx++) {
                atomicAdd(&(ptr_gradInput[kx]), z); // Atomic add to avoid race conditions
            }
            ptr_gradInput += input_w; // Move to the next row
        }
    }
}
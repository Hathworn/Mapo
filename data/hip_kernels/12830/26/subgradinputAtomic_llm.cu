#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void subgradinputAtomic(float *gradInput, float *gradOutput, float *weight, int input_n, int input_h, int input_w, int kH, int kW, int dH, int dW)
{
    // Calculate output size
    int output_w = (input_w - kW) / dW + 1;
    int output_h = (input_h - kH) / dH + 1;

    // Calculate offsets
    int o = blockIdx.x;
    int i = o;
    int k = blockIdx.x % input_n;

    // Calculate start position and step size for each thread
    int xx_start = threadIdx.x;
    int yy_start = blockDim.y * blockIdx.y + threadIdx.y;
    int xx_step = blockDim.x;
    int yy_step = blockDim.y * gridDim.y;

    // Pointer arithmetic for plane selection
    gradOutput += o * output_w * output_h;
    gradInput += i * input_w * input_h;

    // Get the weight for the current index
    float the_weight = weight[k];

    // Calculate gradInput using atomic operations
    for (int yy = yy_start; yy < output_h; yy += yy_step) {
        for (int xx = xx_start; xx < output_w; xx += xx_step) {
            float *ptr_gradInput = gradInput + yy * dH * input_w + xx * dW;
            float *ptr_gradOutput = gradOutput + yy * output_w + xx;
            float z = (*ptr_gradOutput) * the_weight;
            for (int ky = 0; ky < kH; ky++) {
                for (int kx = 0; kx < kW; kx++) {
                    atomicAdd(&(ptr_gradInput[kx]), z); // Atomic addition to avoid race condition
                }
                ptr_gradInput += input_w; // Move to the next row in the input
            }
        }
    }
}
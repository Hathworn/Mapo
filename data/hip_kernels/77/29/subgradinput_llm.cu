#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void subgradinput(float *gradInput, float *gradOutput, int input_n, int input_h, int input_w, int kH, int kW, int dH, int dW)
{
    // Calculate output dimensions
    int output_w = (input_w - kW) / dW + 1;
    int output_h = (input_h - kH) / dH + 1;

    // get current thread positions in the block
    int o = blockIdx.x;
    int i = o;

    // calculate global index positions
    int xx = threadIdx.x + blockIdx.y * blockDim.x;
    int yy = threadIdx.y + blockIdx.z * blockDim.y;

    // check if xx, yy are within output bounds
    if (xx < output_w && yy < output_h) {

        // calculate pointers to the corresponding locations
        gradOutput = gradOutput + o * output_w * output_h;
        gradInput = gradInput + i * input_w * input_h;

        float *ptr_gradInput = gradInput + yy * dH * input_w + xx * dW;
        float *ptr_gradOutput = gradOutput + yy * output_w + xx;
        float z = *ptr_gradOutput;

        // update gradInput using shared data from gradOutput
        for (int ky = 0; ky < kH; ky++) {
            for (int kx = 0; kx < kW; kx++) {
                ptr_gradInput[kx] += z / float(kW * kH);
            }
            ptr_gradInput += input_w;
        }
    }
}
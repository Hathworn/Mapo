#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void subgradinputAtomic(float *gradInput, float *gradOutput, float *weight, int input_n, int input_h, int input_w, int kH, int kW, int dH, int dW) {
    // compute output size
    int output_w = (input_w - kW) / dW + 1;
    int output_h = (input_h - kH) / dH + 1;

    // calculate thread/block based offsets
    int o = blockIdx.x;
    int k = blockIdx.x % input_n; // updated variable usage
    int xx = threadIdx.x + blockDim.x * blockIdx.y; // unify xx_start and yy_start calculation
    int yy = threadIdx.y + blockDim.y * blockIdx.z;

    // select input/output plane with better scope management
    gradOutput += o * output_w * output_h;
    gradInput += o * input_w * input_h;

    // get weight for the current output plane
    float the_weight = weight[k];

    // limit threads within the output dimensions
    if (yy < output_h && xx < output_w) {
        float *ptr_gradInput = gradInput + yy * dH * input_w + xx * dW;
        float *ptr_gradOutput = gradOutput + yy * output_w + xx;
        float z = *ptr_gradOutput * the_weight;

        // loop interchange and reducing redundant pointer calculations
        for (int ky = 0; ky < kH; ky++) {
            for (int kx = 0; kx < kW; kx++) {
                atomicAdd(&(ptr_gradInput[kx]), z);
            }
            ptr_gradInput += input_w; // increment row
        }
    }
}
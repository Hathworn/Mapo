#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void subgradinput(float *gradInput, float *gradOutput, float *weight, int input_n, int input_h, int input_w, int kH, int kW, int dH, int dW)
{
    // Declare shared memory for weights to reduce global memory accesses
    __shared__ float shared_weight;

    // Load weight into shared memory, ensured by single thread per block
    if(threadIdx.x == 0 && threadIdx.y == 0) {
        shared_weight = weight[blockIdx.x % input_n];
    }
    __syncthreads(); // Synchronize to ensure shared memory is loaded

    // Compute output dimensions
    int output_w = (input_w - kW) / dW + 1;
    int output_h = (input_h - kH) / dH + 1;

    // Compute input/output offsets
    int o = blockIdx.x;
    int i = o;
    gradOutput += o * output_w * output_h;
    gradInput += i * input_w * input_h;

    // Iterate over output height
    for (int yy = blockDim.y * blockIdx.y + threadIdx.y; yy < output_h; yy += blockDim.y * gridDim.y) {
        // Iterate over output width
        for (int xx = threadIdx.x; xx < output_w; xx += blockDim.x) {
            float *ptr_gradInput = gradInput + yy * dH * input_w + xx * dW;
            float *ptr_gradOutput = gradOutput + yy * output_w + xx;
            // Use shared weight
            float z = (*ptr_gradOutput) * shared_weight;
            // Directly iterate over kernel height and width, removing unnecessary pointers
            for (int ky = 0; ky < kH; ky++) {
                for (int kx = 0; kx < kW; kx++) {
                    ptr_gradInput[kx] += z;
                }
                ptr_gradInput += input_w;
            }
        }
    }
}
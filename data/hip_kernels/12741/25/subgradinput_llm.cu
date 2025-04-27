#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void subgradinput(float *gradInput, float *gradOutput, float *weight, int input_n, int input_h, int input_w, int kH, int kW, int dH, int dW)
{
    // Compute output size
    int output_w = (input_w - kW) / dW + 1;
    int output_h = (input_h - kH) / dH + 1;

    // Compute offsets based on thread/block ID
    int o = blockIdx.x;
    int i = o;
    int k = blockIdx.x % input_n;

    int xx_start = threadIdx.x;
    int yy_start = blockDim.y * blockIdx.y + threadIdx.y;

    // Select input/output plane
    gradOutput = gradOutput + o * output_w * output_h;
    gradInput = gradInput + i * input_w * input_h;

    // Get weight
    float the_weight = weight[k];

    // Load gradOutput into shared memory for coalesced access
    __shared__ float sharedGradOutput[1024]; // adjust size as needed
    int threadIndex = threadIdx.y * blockDim.x + threadIdx.x;
    if (threadIndex < output_w * output_h) {
        sharedGradOutput[threadIndex] = gradOutput[threadIndex] * the_weight;
    }
    __syncthreads();

    // Compute gradInput
    for (int yy = yy_start; yy < output_h; yy += blockDim.y * gridDim.y) {
        for (int xx = xx_start; xx < output_w; xx += blockDim.x) {
            float z = sharedGradOutput[yy * output_w + xx];
            float *ptr_gradInput = gradInput + yy * dH * input_w + xx * dW;
            for (int ky = 0; ky < kH; ky++) {
                for (int kx = 0; kx < kW; kx++)
                    ptr_gradInput[kx] += z;
                ptr_gradInput += input_w;
            }
        }
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void subgradinput(float *gradInput, float *gradOutput, float *weight, int input_n, int input_h, int input_w, int kH, int kW, int dH, int dW)
{
    // Calculate the start index and step for each thread in the block
    int output_w = (input_w - kW) / dW + 1;
    int output_h = (input_h - kH) / dH + 1;

    int o = blockIdx.x;
    int i = o;
    int k = blockIdx.x % input_n;

    int xx_start = threadIdx.x;
    int yy_start = blockIdx.y * blockDim.y + threadIdx.y;
  
    // Store weight value
    float the_weight = weight[k];
    
    // Offset the pointers for the current block 
    gradOutput += o * output_w * output_h;
    gradInput += i * input_w * input_h;
    
    // Use shared memory for storing partial calculations
    __shared__ float shared_gradOutput[8192];  // example size, adjust according to kernel
    __shared__ float shared_gradInput[8192];   // example size, adjust according to kernel
    
    // Load data into shared memory
    int tid = threadIdx.y * blockDim.x + threadIdx.x;
    shared_gradOutput[tid] = gradOutput[yy_start * output_w + xx_start];
    __syncthreads();
    
    // Perform calculations
    float z = shared_gradOutput[tid] * the_weight;
    for (int ky = 0; ky < kH; ky++) {
        for (int kx = 0; kx < kW; kx++) {
            // Use atomic add to prevent race conditions
            atomicAdd(&shared_gradInput[yy_start * dH * input_w + xx_start * dW + kx + ky * input_w], z);
        }
    }
    __syncthreads();
    
    // Copy results from shared memory back to global memory
    gradInput[yy_start * dH * input_w + xx_start * dW] = shared_gradInput[tid];
}
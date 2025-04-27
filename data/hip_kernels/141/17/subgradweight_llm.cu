#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void subgradweight(float *input, float *gradOutput, float *gradWeight, float *gradBias, int input_n, int input_h, int input_w, int kH, int kW, int dH, int dW, float scale)
{
    // Compute output dimensions
    int output_w = (input_w - kW) / dW + 1;
    int output_h = (input_h - kH) / dH + 1;

    // Compute offsets based on thread/block ID
    int o = blockIdx.x;
    int i = o;
    int k = blockIdx.x % input_n;

    // Start indices and step sizes for iterating output
    int xx_start = threadIdx.x;
    int xx_end = output_w;
    int xx_step = blockDim.x;

    int yy_start = threadIdx.y;
    int yy_end = output_h;
    int yy_step = blockDim.y;

    // Select current gradOutput and input plane
    gradOutput += o * output_w * output_h;
    input += i * input_w * input_h;

    // Thread ID and shared memory for partial sums
    int tid = blockDim.x * threadIdx.y + threadIdx.x;
    __shared__ float sums[CUDA_MAX_THREADS];
    sums[tid] = 0;

    // Compute partial sums
    for (int yy = yy_start; yy < yy_end; yy += yy_step) {
        for (int xx = xx_start; xx < xx_end; xx += xx_step) {
            float *ptr_input = input + yy * dH * input_w + xx * dW;
            float *ptr_gradOutput = gradOutput + yy * output_w + xx;
            float z = *ptr_gradOutput;
            
            // Unroll innermost loop for better performance
            for (int ky = 0; ky < kH; ++ky) {
                #pragma unroll
                for (int kx = 0; kx < kW; ++kx) {
                    sums[tid] += z * ptr_input[kx];
                }
                ptr_input += input_w;
            }
        }
    }
    __syncthreads();

    // Reduce: accumulate partial sums to 1st thread in block
    if (tid == 0) {
        float gradWeightSum = 0;
        for (int i = 0; i < blockDim.x * blockDim.y; i++) {
            gradWeightSum += sums[i];
        }
        atomicAdd(&gradWeight[k], scale * gradWeightSum);
    }
    __syncthreads();

    // Compute gradBias
    sums[tid] = 0;
    for (int i = tid; i < output_w * output_h; i += blockDim.x * blockDim.y) {
        sums[tid] += gradOutput[i];
    }
    __syncthreads();

    // Reduce gradBias to 1st thread in block
    if (tid == 0) {
        float gradBiasSum = 0;
        for (int i = 0; i < blockDim.x * blockDim.y; i++) {
            gradBiasSum += sums[i];
        }
        atomicAdd(&gradBias[k], scale * gradBiasSum);
    }
}
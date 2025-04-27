#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void subgradweight(float *input, float *gradOutput, float *gradWeight, float *gradBias, int input_n, int input_h, int input_w, int kH, int kW, int dH, int dW, float scale)
{
    // Calculate output dimensions
    int output_w = (input_w - kW) / dW + 1;
    int output_h = (input_h - kH) / dH + 1;

    // Compute thread block and thread ID
    int o = blockIdx.x;
    int k = blockIdx.x % input_n;
    int tid = threadIdx.y * blockDim.x + threadIdx.x;

    // Calculate indices for starting positions and steps
    int yy_start = threadIdx.y, yy_end = output_h;
    int xx_start = threadIdx.x, xx_end = output_w;
    int xx_step = blockDim.x, yy_step = blockDim.y;

    // Point to the respective input and gradOutput planes
    gradOutput += o * output_w * output_h;
    input += o * input_w * input_h;

    // Shared memory for partial sums: gradWeight and gradBias computation
    __shared__ float shared_sums[2][CUDA_MAX_THREADS];
    shared_sums[0][tid] = 0.0f;  // For gradWeight
    shared_sums[1][tid] = 0.0f;  // For gradBias

    // Compute partial sums for gradWeight
    for (int yy = yy_start; yy < yy_end; yy += yy_step) {
        for (int xx = xx_start; xx < xx_end; xx += xx_step) {
            float *ptr_input = input + yy * dH * input_w + xx * dW;
            float z = gradOutput[yy * output_w + xx];
            for (int ky = 0; ky < kH; ++ky) {
                for (int kx = 0; kx < kW; ++kx) {
                    shared_sums[0][tid] += z * ptr_input[kx];
                }
                ptr_input += input_w;
            }
        }
    }
    __syncthreads();

    // Reduce for gradWeight
    if (tid == 0) {
        float total = 0;
        for (int i = 0; i < blockDim.x * blockDim.y; ++i) {
            total += shared_sums[0][i];
        }
        gradWeight[k] += scale * total;
    }
    __syncthreads();

    // Compute partial sums for gradBias
    for (int i = tid; i < output_w * output_h; i += blockDim.x * blockDim.y) {
        shared_sums[1][tid] += gradOutput[i];
    }
    __syncthreads();

    // Reduce for gradBias
    if (tid == 0) {
        float total = 0;
        for (int i = 0; i < blockDim.x * blockDim.y; ++i) {
            total += shared_sums[1][i];
        }
        gradBias[k] += scale * total;
    }
}
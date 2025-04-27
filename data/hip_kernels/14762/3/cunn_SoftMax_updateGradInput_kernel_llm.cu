#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cunn_SoftMax_updateGradInput_kernel(float *gradInput, float *output, float *gradOutput, int nframe, int dim)
{
    __shared__ float buffer[SOFTMAX_THREADS];
    int k = blockIdx.x;
    float *gradInput_k = gradInput + k * dim;
    float *output_k = output + k * dim;
    float *gradOutput_k = gradOutput + k * dim;

    int i_start = threadIdx.x;
    int i_end = dim;
    int i_step = blockDim.x;

    // Initialize buffer
    float sum = 0.0f;
    for (int i = i_start; i < i_end; i += i_step) {
        sum += gradOutput_k[i] * output_k[i];
    }

    // Reduce sum across thread block
    buffer[threadIdx.x] = sum;
    __syncthreads();

    // Perform reduction using binary tree method
    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
        if (threadIdx.x < stride) {
            buffer[threadIdx.x] += buffer[threadIdx.x + stride];
        }
        __syncthreads();
    }

    sum = buffer[0];
    for (int i = i_start; i < i_end; i += i_step) {
        gradInput_k[i] = output_k[i] * (gradOutput_k[i] - sum);
    }
}
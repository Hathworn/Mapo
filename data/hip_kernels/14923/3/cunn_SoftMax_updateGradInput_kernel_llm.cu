#include "hip/hip_runtime.h"
#include "includes.h"

#define SOFTMAX_THREADS 1024

__global__ void cunn_SoftMax_updateGradInput_kernel(float *gradInput, float *output, float *gradOutput, int nframe, int dim, int stride)
{
    __shared__ float buffer[SOFTMAX_THREADS];
    float *gradInput_k = gradInput + blockIdx.x * dim * stride + blockIdx.y;
    float *output_k = output + blockIdx.x * dim * stride + blockIdx.y;
    float *gradOutput_k = gradOutput + blockIdx.x * dim * stride + blockIdx.y;

    int i_start = threadIdx.x;
    int i_end = dim;
    int i_step = blockDim.x;

    // Initialize buffer with 0
    float local_sum = 0.0f;
    for (int i = i_start; i < i_end; i += i_step)
    {
        local_sum += gradOutput_k[i * stride] * output_k[i * stride];
    }
    buffer[threadIdx.x] = local_sum; // Store local sum to shared memory

    __syncthreads();

    // Perform parallel reduction
    for (int offset = blockDim.x / 2; offset > 0; offset >>= 1)
    {
        if (threadIdx.x < offset)
        {
            buffer[threadIdx.x] += buffer[threadIdx.x + offset];
        }
        __syncthreads();
    }

    float sum_k = buffer[0]; // The reduced sum from all threads
    for (int i = i_start; i < i_end; i += i_step)
    {
        gradInput_k[i * stride] = output_k[i * stride] * (gradOutput_k[i * stride] - sum_k);
    }
}
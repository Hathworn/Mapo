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

    // Compute partial sums and store in shared memory
    float sum = 0;
    for (int i = i_start; i < i_end; i += i_step)
        sum += gradOutput_k[i] * output_k[i];
    buffer[threadIdx.x] = sum;
    __syncthreads();

    // Parallel reduction to sum all elements in buffer
    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
        if (threadIdx.x < stride)
            buffer[threadIdx.x] += buffer[threadIdx.x + stride];
        __syncthreads();
    }

    // Calculate gradInput using the computed sum
    float sum_k = buffer[0];
    for (int i = i_start; i < i_end; i += i_step)
        gradInput_k[i] = output_k[i] * (gradOutput_k[i] - sum_k);
}
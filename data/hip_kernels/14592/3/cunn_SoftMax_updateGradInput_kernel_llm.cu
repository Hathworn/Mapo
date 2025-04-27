#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cunn_SoftMax_updateGradInput_kernel(float *gradInput, float *output, float *gradOutput, int nframe, int dim)
{
    __shared__ float buffer[SOFTMAX_THREADS];
    int k = blockIdx.x;
    float *gradInput_k = gradInput + k*dim;
    float *output_k = output + k*dim;
    float *gradOutput_k = gradOutput + k*dim;

    int i_start = threadIdx.x;
    int i_end = dim;
    int i_step = blockDim.x;

    // Parallel sum
    float local_sum = 0.0f;
    for (int i=i_start; i<i_end; i+=i_step)
        local_sum += gradOutput_k[i] * output_k[i];
    buffer[threadIdx.x] = local_sum;

    __syncthreads();

    // Efficient reduction
    for (int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (threadIdx.x < s) {
            buffer[threadIdx.x] += buffer[threadIdx.x + s];
        }
        __syncthreads();
    }

    float sum_k = buffer[0];
    for (int i=i_start; i<i_end; i+=i_step)
        gradInput_k[i] = output_k[i] * (gradOutput_k[i] - sum_k);
}
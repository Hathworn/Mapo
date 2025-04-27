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

    // Initialize buffer and accumulate in a single pass
    float sum_k = 0.0f;
    for (int i = i_start; i < i_end; i += i_step)
    {
        sum_k += gradOutput_k[i] * output_k[i];
    }
    buffer[threadIdx.x] = sum_k;

    __syncthreads();

    // Optimized warp-level reduction for sum
    if (threadIdx.x < 32)
    {
        for (int offset = 32; offset < blockDim.x; offset += 32)
        {
            if (threadIdx.x + offset < blockDim.x)
            {
                buffer[threadIdx.x] += buffer[threadIdx.x + offset];
            }
        }

        sum_k = buffer[0];
        for (int offset = 16; offset > 0; offset /= 2)
        {
            sum_k += __shfl_down(sum_k, offset);
        }
        if (threadIdx.x == 0)
        {
            buffer[0] = sum_k;
        }
    }

    __syncthreads();

    sum_k = buffer[0];
    for (int i = i_start; i < i_end; i += i_step)
    {
        gradInput_k[i] = output_k[i] * (gradOutput_k[i] - sum_k);
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cunn_SoftMax_updateGradInput_kernel(float *gradInput, float *output, float *gradOutput, int nframe, int dim)
{
    // Use warp shuffle to implement reduction for better performance
    __shared__ float buffer[SOFTMAX_THREADS];
    int k = blockIdx.x;
    float *gradInput_k = gradInput + k * dim;
    float *output_k = output + k * dim;
    float *gradOutput_k = gradOutput + k * dim;

    int i_start = threadIdx.x;
    int i_end = dim;
    int i_step = blockDim.x;

    float threadSum = 0;
    for (int i = i_start; i < i_end; i += i_step)
        threadSum += gradOutput_k[i] * output_k[i];

    // Perform reduction using warp shuffle
    for (int offset = warpSize / 2; offset > 0; offset /= 2)
        threadSum += __shfl_down(threadSum, offset);

    // Write result from each warp back to shared memory
    if (threadIdx.x % warpSize == 0)
        buffer[threadIdx.x / warpSize] = threadSum;

    __syncthreads();

    // Final reduction among warps
    float sum_k = 0;
    if (threadIdx.x < blockDim.x / warpSize) {
        sum_k = buffer[threadIdx.x];
        for (int offset = blockDim.x / warpSize / 2; offset > 0; offset /= 2)
            sum_k += __shfl_down(sum_k, offset);

        if(threadIdx.x == 0)
            buffer[0] = sum_k;
    }

    __syncthreads();

    sum_k = buffer[0];
    for (int i = i_start; i < i_end; i += i_step)
        gradInput_k[i] = output_k[i] * (gradOutput_k[i] - sum_k);
}
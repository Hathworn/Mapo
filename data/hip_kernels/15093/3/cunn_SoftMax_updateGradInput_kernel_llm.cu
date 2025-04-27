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
    int i_step = blockDim.x;

    // Efficient sum calculation using warp-level synchronization.
    float sum_partial = 0.0f;
    for (int i = i_start; i < dim; i += i_step) {
        sum_partial += gradOutput_k[i] * output_k[i];
    }
    buffer[threadIdx.x] = sum_partial;
    __syncthreads();

    // Warp reduction
    for (int offset = warpSize / 2; offset > 0; offset /= 2) {
        if (threadIdx.x < offset) {
            buffer[threadIdx.x] += buffer[threadIdx.x + offset];
        }
        __syncthreads();
    }

    // Update gradInput using the computed sum
    float sum_k = buffer[0];
    for (int i = i_start; i < dim; i += i_step) {
        gradInput_k[i] = output_k[i] * (gradOutput_k[i] - sum_k);
    }
}
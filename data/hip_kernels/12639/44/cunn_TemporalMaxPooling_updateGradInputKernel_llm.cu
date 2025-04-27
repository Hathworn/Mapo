#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cunn_TemporalMaxPooling_updateGradInputKernel(float *gradInput, float *gradOutput, float *indices, int input_w, int input_n, int output_w, int kW, int dW) {
    // Calculate time index and batch index
    int timeIdx = threadIdx.x + blockIdx.y * TEMPORAL_MAX_POOLING_THREADS;
    if (timeIdx >= output_w) return; // Early exit if out of bounds

    int batchIdx = blockIdx.x;
    int inputOffset = batchIdx * input_w * input_n + timeIdx * input_n * dW;
    int outputOffset = batchIdx * output_w * input_n + timeIdx * input_n;

    float *gradInput_data = gradInput + inputOffset;
    float *gradOutput_data = gradOutput + outputOffset;
    float *indices_data = indices + outputOffset;

    // Load gradOutput data and update gradInput
    for (int feat = 0; feat < input_n; ++feat) {
        int idx = (int)indices_data[feat];
        atomicAdd(&gradInput_data[idx * input_n + feat], gradOutput_data[feat]);  // Ensure atomic operation for potential race conditions
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cunn_TemporalMaxPooling_updateGradInputKernel(float *gradInput, float *gradOutput, float *indices, int input_w, int input_n, int output_w, int kW, int dW) {
    // Precalculate and streamline memory access
    int time_idx = threadIdx.x + blockIdx.y * TEMPORAL_MAX_POOLING_THREADS;
    if (time_idx < output_w) {
        int batch_offset = blockIdx.x * input_w * input_n;
        float *gradInput_data = gradInput + batch_offset + time_idx * input_n * dW;
        float *gradOutput_data = gradOutput + batch_offset + time_idx * input_n;
        float *indices_data = indices + batch_offset + time_idx * input_n;

        // Direct feature loop access
        for (int feat = 0; feat < input_n; ++feat) {
            int idx = (int)indices_data[feat] * input_n + feat;
            atomicAdd(&gradInput_data[idx], gradOutput_data[feat]); // Use atomic operation to avoid race conditions
        }
    }
}
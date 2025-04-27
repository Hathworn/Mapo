#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cunn_TemporalMaxPooling_updateGradInputKernelAtomic(float *gradInput, float *gradOutput, float *indices, int input_w, int input_n, int output_w, int kW, int dW) {
    // Precompute indexes to minimize repeated calculations
    int time_idx = threadIdx.x + blockIdx.y * TEMPORAL_MAX_POOLING_THREADS;
    int gradInput_offset = blockIdx.x * input_w * input_n + time_idx * input_n * dW;
    int gradOutput_offset = blockIdx.x * output_w * input_n + time_idx * input_n;
    int indices_offset = gradOutput_offset;

    // Check valid output_w range
    if (time_idx < output_w) {
        // Optimize feature processing using pointer arithmetic
        float *gradInput_data_feat = gradInput + gradInput_offset;
        float *gradOutput_data_feat = gradOutput + gradOutput_offset;
        float *indices_data_feat = indices + indices_offset;

        // For all features using direct atomic access
        for (int feat = 0; feat < input_n; ++feat) {
            int index = (int)indices_data_feat[feat] * input_n + feat;
            atomicAdd(&gradInput_data_feat[index], gradOutput_data_feat[feat]);
        }
    }
}
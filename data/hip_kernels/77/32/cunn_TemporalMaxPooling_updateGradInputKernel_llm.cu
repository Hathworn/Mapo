#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cunn_TemporalMaxPooling_updateGradInputKernel(float *gradInput, float *gradOutput, float *indices, int input_w, int input_n, int output_w, int kW, int dW) {
    // Precompute offsets for efficiency
    int index_offset = blockIdx.x * input_w * input_n + (
                    threadIdx.x + blockIdx.y * TEMPORAL_MAX_POOLING_THREADS) * input_n * dW;
    int output_offset = blockIdx.x * output_w * input_n + (
                    threadIdx.x + blockIdx.y * TEMPORAL_MAX_POOLING_THREADS) * input_n;

    // Determine if current thread is within bounds
    int current_index = threadIdx.x + blockIdx.y * TEMPORAL_MAX_POOLING_THREADS;
    if (current_index < output_w) {
        // Load data pointers
        float *gradInput_data = gradInput + index_offset;
        float *gradOutput_data = gradOutput + output_offset;
        float *indices_data = indices + output_offset;

        // For all features
        for (int feat = 0; feat < input_n; ++feat) {
            // Direct indexing into arrays for efficiency
            int index = static_cast<int>(indices_data[feat]) * input_n + feat;
            gradInput_data[index] += gradOutput_data[feat];
        }
    }
}
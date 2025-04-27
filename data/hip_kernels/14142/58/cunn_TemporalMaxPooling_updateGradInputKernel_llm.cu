#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cunn_TemporalMaxPooling_updateGradInputKernel(float *gradInput, float *gradOutput, float *indices, int input_w, int input_n, int output_w, int kW, int dW) {
    // Calculate global index for threads
    int globalIndex = threadIdx.x + blockIdx.y * TEMPORAL_MAX_POOLING_THREADS;
    
    // Check if within output width to reduce divergence
    if (globalIndex < output_w) {
        // Calculate offsets for gradInput, gradOutput, and indices
        size_t batchOffset = blockIdx.x * input_n;
        float *gradInput_data = gradInput + batchOffset * input_w + globalIndex * input_n * dW;
        float *gradOutput_data = gradOutput + batchOffset * output_w + globalIndex * input_n;
        float *indices_data = indices + batchOffset * output_w + globalIndex * input_n;

        // Process all features
        for (int feat = 0; feat < input_n; ++feat) {
            // Use indices to update gradInput
            int index = static_cast<int>(indices_data[feat]);
            gradInput_data[index * input_n + feat] += gradOutput_data[feat];
        }
    }
}
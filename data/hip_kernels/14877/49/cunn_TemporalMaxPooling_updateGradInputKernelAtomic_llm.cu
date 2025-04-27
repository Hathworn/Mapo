#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cunn_TemporalMaxPooling_updateGradInputKernelAtomic(float *gradInput, float *gradOutput, float *indices, int input_w, int input_n, int output_w, int kW, int dW) {
    // Pre-calculate offsets for each input pointer to improve readability
    int batch_idx = blockIdx.x;
    int time_idx = threadIdx.x + blockIdx.y * TEMPORAL_MAX_POOLING_THREADS;
    
    // Only proceed with relevant threads
    if (time_idx < output_w) {
        float *gradInput_data = gradInput + batch_idx * input_w * input_n + time_idx * input_n * dW;
        float *gradOutput_data = gradOutput + batch_idx * output_w * input_n + time_idx * input_n;
        float *indices_data = indices + batch_idx * output_w * input_n + time_idx * input_n;

        // Utilize local memory for indices within this thread context
        for (int feat = 0; feat < input_n; ++feat) {
            int index = static_cast<int>(indices_data[feat]);
            atomicAdd(&gradInput_data[index * input_n + feat], gradOutput_data[feat]);
        }
    }
}
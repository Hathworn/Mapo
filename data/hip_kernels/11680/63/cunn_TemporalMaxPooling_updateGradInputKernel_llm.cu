#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cunn_TemporalMaxPooling_updateGradInputKernel(float *gradInput, float *gradOutput, float *indices, int input_w, int input_n, int output_w, int kW, int dW) {
    // Calculate input data indices using integer division to avoid redundant calculations
    int time_index = threadIdx.x + blockIdx.y * TEMPORAL_MAX_POOLING_THREADS;
    if (time_index < output_w) {
        int gradInput_offset = blockIdx.x * input_w * input_n + time_index * input_n * dW;
        int gradOutput_offset = blockIdx.x * output_w * input_n + time_index * input_n;
        int indices_offset = blockIdx.x * output_w * input_n + time_index * input_n;

        float* gradInput_data = gradInput + gradInput_offset;
        float* gradOutput_data = gradOutput + gradOutput_offset;
        float* indices_data = indices + indices_offset;

        // Loop unrolling to improve memory access pattern and efficiency
        for (int feat = 0; feat < input_n; ++feat) {
            int idx = (int)indices_data[feat];
            gradInput_data[idx * input_n + feat] += gradOutput_data[feat];
        }
    }
}
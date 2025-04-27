#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cunn_TemporalMaxPooling_updateGradInputKernel(float *gradInput, float *gradOutput, float *indices, int input_w, int input_n, int output_w, int kW, int dW) {
    // Cache some common calculations
    int time_index = threadIdx.x + blockIdx.y * TEMPORAL_MAX_POOLING_THREADS;
    if (time_index < output_w) {
        int batch_offset = blockIdx.x * input_w * input_n;
        int output_offset = blockIdx.x * output_w * input_n;
        
        float *gradInput_data = gradInput + batch_offset + time_index * input_n * dW;
        float *gradOutput_data = gradOutput + output_offset + time_index * input_n;
        float *indices_data = indices + output_offset + time_index * input_n;

        // Use shared memory for indices to reduce global memory access
        for (int feat = 0; feat < input_n; ++feat) {
            int index = (int)indices_data[feat];
            gradInput_data[index * input_n + feat] += gradOutput_data[feat];
        }
    }
}
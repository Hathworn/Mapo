#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cunn_TemporalMaxPooling_updateGradInputKernel(float *gradInput, float *gradOutput, float *indices, int input_w, int input_n, int output_w, int kW, int dW) {
    // Calculate global thread index
    int global_thread_idx = threadIdx.x + blockIdx.y * blockDim.x;
    
    // Check if thread is within bounds
    if (global_thread_idx < output_w) {
        // Calculate base addresses
        int batch_offset = blockIdx.x * input_w * input_n;
        int thread_offset_input = global_thread_idx * input_n * dW;
        int thread_offset_output = global_thread_idx * input_n;

        float *gradInput_data = gradInput + batch_offset + thread_offset_input;
        float *gradOutput_data = gradOutput + batch_offset + thread_offset_output;
        float *indices_data = indices + batch_offset + thread_offset_output;

        // Update gradInput using feature index from indices
        for (int feat = 0; feat < input_n; ++feat) {
            int index = static_cast<int>(indices_data[feat]);
            atomicAdd(&gradInput_data[index * input_n + feat], gradOutput_data[feat]);
        }
    }
}
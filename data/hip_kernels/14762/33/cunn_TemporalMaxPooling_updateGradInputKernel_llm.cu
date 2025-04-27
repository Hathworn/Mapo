#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cunn_TemporalMaxPooling_updateGradInputKernel(float *gradInput, float *gradOutput, float *indices, int input_w, int input_n, int output_w, int kW, int dW) {
    // Reduce redundant calculations by computing offsets once
    int time_idx = threadIdx.x + blockIdx.y * TEMPORAL_MAX_POOLING_THREADS;
    if (time_idx < output_w) {
        int gradInput_offset = blockIdx.x * input_w * input_n + time_idx * input_n * dW;
        int gradOutput_offset = blockIdx.x * output_w * input_n + time_idx * input_n;
        int indices_offset = blockIdx.x * output_w * input_n + time_idx * input_n;

        // Load data into registers to reduce repeated global memory access
        float *gradOutput_data = gradOutput + gradOutput_offset;
        float *indices_data = indices + indices_offset;

        // Use loop unrolling for better performance
        #pragma unroll
        for (int feat = 0; feat < input_n; ++feat) {
            // Atomic addition to avoid race conditions
            atomicAdd(gradInput + gradInput_offset + (int)indices_data[feat] * input_n + feat, gradOutput_data[feat]);
        }
    }
}
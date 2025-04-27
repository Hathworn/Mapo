#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cunn_TemporalMaxPooling_updateGradInputKernelAtomic(float *gradInput, float *gradOutput, float *indices, int input_w, int input_n, int output_w, int kW, int dW) {
    // Pre-calculate commonly used values outside of loop
    int global_idx = threadIdx.x + blockIdx.y * TEMPORAL_MAX_POOLING_THREADS;
    if (global_idx < output_w) {
        float *gradInput_data = gradInput + blockIdx.x * input_w * input_n + global_idx * input_n * dW;
        float *gradOutput_data = gradOutput + blockIdx.x * output_w * input_n + global_idx * input_n;
        float *indices_data = indices + blockIdx.x * output_w * input_n + global_idx * input_n;

        // Unrolling loop for better performance
        for (int feat = 0; feat < input_n; feat += 4) {
            atomicAdd(&gradInput_data[(int)indices_data[feat] * input_n + feat], gradOutput_data[feat]);
            if (feat + 1 < input_n) atomicAdd(&gradInput_data[(int)indices_data[feat + 1] * input_n + feat + 1], gradOutput_data[feat + 1]);
            if (feat + 2 < input_n) atomicAdd(&gradInput_data[(int)indices_data[feat + 2] * input_n + feat + 2], gradOutput_data[feat + 2]);
            if (feat + 3 < input_n) atomicAdd(&gradInput_data[(int)indices_data[feat + 3] * input_n + feat + 3], gradOutput_data[feat + 3]);
        }
    }
}
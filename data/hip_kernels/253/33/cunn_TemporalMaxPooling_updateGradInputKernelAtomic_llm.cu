#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cunn_TemporalMaxPooling_updateGradInputKernelAtomic(float *gradInput, float *gradOutput, float *indices, int input_w, int input_n, int output_w, int kW, int dW) {
    // Calculate the unique index for each thread based on block and thread IDs
    int global_tid = threadIdx.x + blockIdx.y * TEMPORAL_MAX_POOLING_THREADS;
    int batch_offset = blockIdx.x * input_w * input_n;

    // Set pointers for gradInput, gradOutput, and indices
    float *gradInput_data = gradInput + batch_offset + global_tid * input_n * dW;
    float *gradOutput_data = gradOutput + batch_offset + global_tid * input_n;
    float *indices_data = indices + batch_offset + global_tid * input_n;

    // Ensure the current thread is processing a valid output width
    if (global_tid < output_w) {
        // Loop over all features
        for (int feat = 0; feat < input_n; ++feat) {
            // Atomic add for safe updates to gradInput
            atomicAdd(&gradInput_data[(int)indices_data[feat] * input_n + feat], gradOutput_data[feat]);
        }
    }
}
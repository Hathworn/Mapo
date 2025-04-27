#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cunn_TemporalMaxPooling_updateGradInputKernelAtomic(
    float *gradInput, float *gradOutput, float *indices, int input_w, 
    int input_n, int output_w, int kW, int dW) 
{
    // Precompute starting indices for gradInput, gradOutput, and indices
    int timeIndex = threadIdx.x + blockIdx.y * TEMPORAL_MAX_POOLING_THREADS;
    if (timeIndex < output_w) {
        int batchIndex = blockIdx.x * output_w * input_n + timeIndex * input_n;
        int inputBatchIdx = blockIdx.x * input_w * input_n + timeIndex * input_n * dW;
        
        float *gradInput_data = gradInput + inputBatchIdx;
        float *gradOutput_data = gradOutput + batchIndex;
        float *indices_data = indices + batchIndex;

        // Use a single loop to process features
        for (int feat = 0; feat < input_n; ++feat) {
            float idx = indices_data[feat];
            atomicAdd(&gradInput_data[(int)idx * input_n + feat], gradOutput_data[feat]);
        }
    }
}
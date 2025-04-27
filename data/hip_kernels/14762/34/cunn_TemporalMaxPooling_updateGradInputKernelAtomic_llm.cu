#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cunn_TemporalMaxPooling_updateGradInputKernelAtomic(float *gradInput, float *gradOutput, float *indices, int input_w, int input_n, int output_w, int kW, int dW) {
    // Calculate global thread index
    int globalThreadIdx = threadIdx.x + blockIdx.y * TEMPORAL_MAX_POOLING_THREADS;

    // Calculate the base offset
    int baseInputOffset = blockIdx.x * input_w * input_n + globalThreadIdx * input_n * dW;
    int baseOutputOffset = blockIdx.x * output_w * input_n + globalThreadIdx * input_n;
    
    if (globalThreadIdx < output_w) {
        // Access gradInput, gradOutput, and indices data directly using the base offsets
        float *gradInput_data = gradInput + baseInputOffset;
        float *gradOutput_data = gradOutput + baseOutputOffset;
        float *indices_data = indices + baseOutputOffset;
        
        // Optimize loop to increment pointers instead of using indexing in atomicAdd
        for (int feat = 0; feat < input_n; ++feat) {
            atomicAdd(&gradInput_data[(int)indices_data[feat] * input_n + feat], gradOutput_data[feat]);
        }
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cunn_TemporalMaxPooling_updateGradInputKernelAtomic(float *gradInput, float *gradOutput, float *indices, int input_w, int input_n, int output_w, int kW, int dW) {
    // Calculate total thread index for output
    int index = threadIdx.x + blockIdx.y * TEMPORAL_MAX_POOLING_THREADS;
    
    // Check if the thread is within bounds
    if (index < output_w) {
        // Calculate per-thread position based offsets
        int gradInput_offset = blockIdx.x * input_w * input_n + index * input_n * dW;
        int gradOutput_offset = blockIdx.x * output_w * input_n + index * input_n;
        int indices_offset = blockIdx.x * output_w * input_n + index * input_n;
        
        // Iterate over all features and perform atomic addition
        for (int feat = 0; feat < input_n; ++feat) {
            int input_idx = static_cast<int>(indices[indices_offset + feat]) * input_n + feat;
            atomicAdd(&gradInput[gradInput_offset + input_idx], gradOutput[gradOutput_offset + feat]);
        }
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cunn_TemporalMaxPooling_updateGradInputKernel(float *gradInput, float *gradOutput, float *indices, int input_w, int input_n, int output_w, int kW, int dW) {
    // Calculate global indices for threads
    int batch_idx = blockIdx.x;
    int time_idx = threadIdx.x + blockIdx.y * TEMPORAL_MAX_POOLING_THREADS;
    
    if (time_idx < output_w) {
        // Compute base pointers for current batch
        float *gradInput_data = gradInput + batch_idx * input_w * input_n + time_idx * input_n * dW;
        float *gradOutput_data = gradOutput + batch_idx * output_w * input_n + time_idx * input_n;
        float *indices_data = indices + batch_idx * output_w * input_n + time_idx * input_n;

        // Unroll loop over input_n for better performance
        for (int feat = 0; feat < input_n; ++feat) {
            int idx = static_cast<int>(indices_data[feat]) * input_n + feat;
            // Accumulate gradient
            atomicAdd(&gradInput_data[idx], gradOutput_data[feat]);
        }
    }
}
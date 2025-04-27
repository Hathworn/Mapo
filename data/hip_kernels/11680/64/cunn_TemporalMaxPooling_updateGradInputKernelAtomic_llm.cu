#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cunn_TemporalMaxPooling_updateGradInputKernelAtomic(float *gradInput, float *gradOutput, float *indices, int input_w, int input_n, int output_w, int kW, int dW) {
    // Calculate the global thread index for the time dimension
    int time_index = threadIdx.x + blockIdx.y * TEMPORAL_MAX_POOLING_THREADS;
    
    if (time_index < output_w) {
        // Calculate pointers offset for current batch and time index
        float *gradInput_data = gradInput + blockIdx.x * input_w * input_n + time_index * input_n * dW;
        float *gradOutput_data = gradOutput + blockIdx.x * output_w * input_n + time_index * input_n;
        float *indices_data = indices + blockIdx.x * output_w * input_n + time_index * input_n;
        
        // Unrolling loop to improve performance when input_n is a small and fixed known value
        for (int feat = 0; feat < input_n; ++feat) {
            // Use atomicAdd to accumulate gradient
            atomicAdd(&gradInput_data[(int)indices_data[feat] * input_n + feat], gradOutput_data[feat]);
        }
    }
}
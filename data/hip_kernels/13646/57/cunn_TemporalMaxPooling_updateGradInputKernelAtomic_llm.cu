#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cunn_TemporalMaxPooling_updateGradInputKernelAtomic(float *gradInput, float *gradOutput, float *indices, int input_w, int input_n, int output_w, int kW, int dW) {
    // Compute global time index
    int globalTimeIdx = threadIdx.x + blockIdx.y * TEMPORAL_MAX_POOLING_THREADS;
    
    // Check bounds to avoid extra computation
    if (globalTimeIdx < output_w) {
        // Calculate the base data pointers for this block
        float *gradInput_data = gradInput + blockIdx.x * input_w * input_n + globalTimeIdx * input_n * dW;
        float *gradOutput_data = gradOutput + blockIdx.x * output_w * input_n + globalTimeIdx * input_n;
        float *indices_data = indices + blockIdx.x * output_w * input_n + globalTimeIdx * input_n;

        // Use loop unrolling for potential performance gain
        int feat = 0;
        for (; feat + 3 < input_n; feat += 4) {
            atomicAdd(&gradInput_data[(int)indices_data[feat] * input_n + feat], gradOutput_data[feat]);
            atomicAdd(&gradInput_data[(int)indices_data[feat+1] * input_n + feat+1], gradOutput_data[feat+1]);
            atomicAdd(&gradInput_data[(int)indices_data[feat+2] * input_n + feat+2], gradOutput_data[feat+2]);
            atomicAdd(&gradInput_data[(int)indices_data[feat+3] * input_n + feat+3], gradOutput_data[feat+3]);
        }
        // Handle the remaining elements
        for (; feat < input_n; ++feat) {
            atomicAdd(&gradInput_data[(int)indices_data[feat] * input_n + feat], gradOutput_data[feat]);
        }
    }
}
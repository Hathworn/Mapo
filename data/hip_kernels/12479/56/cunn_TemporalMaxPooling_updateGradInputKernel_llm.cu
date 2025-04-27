#include "hip/hip_runtime.h"
#include "includes.h"

#define BLOCK_SIZE 256  // Define block size for optimizations

__global__ void cunn_TemporalMaxPooling_updateGradInputKernel(float *gradInput, float *gradOutput, float *indices, int input_w, int input_n, int output_w, int kW, int dW) {
    // Optimize memory access by using local threadIdx variables
    int timeIndex = threadIdx.x + blockIdx.y * BLOCK_SIZE;

    if (timeIndex < output_w) {  // Ensure threads don't exceed output dimensions
        float *gradInput_data = gradInput + blockIdx.x * input_w * input_n + timeIndex * input_n * dW;
        float *gradOutput_data = gradOutput + blockIdx.x * output_w * input_n + timeIndex * input_n;
        float *indices_data = indices + blockIdx.x * output_w * input_n + timeIndex * input_n;

        // Loop through features using optimized access pattern
        for (int feat = 0; feat < input_n; ++feat) {
            int idx = (int)indices_data[feat] * input_n + feat;
            atomicAdd(&gradInput_data[idx], gradOutput_data[feat]);  // Use atomicAdd for safe parallel updates
        }
    }
}
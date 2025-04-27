#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cunn_TemporalMaxPooling_updateGradInputKernelAtomic(float *gradInput, float *gradOutput, float *indices, int input_w, int input_n, int output_w, int kW, int dW) {
    // Compute unique linear thread index
    int index = threadIdx.x + blockIdx.y * blockDim.x;

    // Compute base pointers for gradInput/gradOutput/indices for the current batch
    float *gradInput_data = gradInput + blockIdx.x * input_w * input_n + index * input_n * dW;
    float *gradOutput_data = gradOutput + blockIdx.x * output_w * input_n + index * input_n;
    float *indices_data = indices + blockIdx.x * output_w * input_n + index * input_n;

    // Ensure thread index is within bounds
    if (index < output_w) {
        // For all features
        for (int feat = 0; feat < input_n; ++feat) {
            // Atomic add to ensure correctness with concurrent writes
            atomicAdd(&gradInput_data[(int)indices_data[feat] * input_n + feat], gradOutput_data[feat]);
        }
    }
}
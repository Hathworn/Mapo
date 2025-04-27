#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cunn_TemporalMaxPooling_updateGradInputKernelAtomic(float *gradInput, float *gradOutput, float *indices, int input_w, int input_n, int output_w, int kW, int dW) {
    // Calculate offsets once outside the loop to reduce repeated calculations in the loop
    int timeIndex = threadIdx.x + blockIdx.y * TEMPORAL_MAX_POOLING_THREADS;
    if (timeIndex < output_w) {
        float *gradInput_data = gradInput + blockIdx.x * input_w * input_n + timeIndex * input_n * dW;
        float *gradOutput_data = gradOutput + blockIdx.x * output_w * input_n + timeIndex * input_n;
        float *indices_data = indices + blockIdx.x * output_w * input_n + timeIndex * input_n;

        // Use register to hold the offset index for atomicAdd to minimize memory access
        int offset;
        for (int feat = 0; feat < input_n; ++feat) {
            offset = (int)indices_data[feat] * input_n + feat;
            atomicAdd(&gradInput_data[offset], gradOutput_data[feat]);
        }
    }
}
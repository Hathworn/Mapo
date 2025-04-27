#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cunn_TemporalMaxPooling_updateGradInputKernelAtomic(float *gradInput, float *gradOutput, float *indices, int input_w, int input_n, int output_w, int kW, int dW) {
    int batchIndex = blockIdx.x;
    int timeIndex = threadIdx.x + blockIdx.y * TEMPORAL_MAX_POOLING_THREADS;

    if (timeIndex < output_w) {
        // Directly calculate the offsets
        float *gradInput_data = gradInput + batchIndex * input_w * input_n + timeIndex * input_n * dW;
        float *gradOutput_data = gradOutput + batchIndex * output_w * input_n + timeIndex * input_n;
        float *indices_data = indices + batchIndex * output_w * input_n + timeIndex * input_n;

        // Use unrolled loop for memory coalescing optimization
        for (int feat = 0; feat < input_n; ++feat) {
            int gradInputIndex = static_cast<int>(indices_data[feat]) * input_n + feat;
            atomicAdd(&gradInput_data[gradInputIndex], gradOutput_data[feat]);
        }
    }
}
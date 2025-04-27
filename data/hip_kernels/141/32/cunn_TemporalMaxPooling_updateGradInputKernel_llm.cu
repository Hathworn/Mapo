#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cunn_TemporalMaxPooling_updateGradInputKernel(float *gradInput, float *gradOutput, float *indices, int input_w, int input_n, int output_w, int kW, int dW) {
    // Calculate offsets
    int timeIndex = threadIdx.x + blockIdx.y * TEMPORAL_MAX_POOLING_THREADS;
    if (timeIndex >= output_w) return; // Early exit for out-of-bounds threads

    int batchOffset = blockIdx.x * input_w * input_n;
    int gradInputOffset = timeIndex * input_n * dW;
    int gradOutputOffset = timeIndex * input_n;
    int indicesOffset = timeIndex * input_n;

    float *gradInput_data = gradInput + batchOffset + gradInputOffset;
    float *gradOutput_data = gradOutput + batchOffset + gradOutputOffset;
    float *indices_data = indices + batchOffset + indicesOffset;

    // Update gradInput for each feature
    for (int feat = 0; feat < input_n; ++feat) {
        int index = static_cast<int>(indices_data[feat]) * input_n + feat;
        atomicAdd(&gradInput_data[index], gradOutput_data[feat]); // Use atomicAdd to avoid race conditions
    }
}
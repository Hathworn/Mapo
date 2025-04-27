#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cunn_TemporalMaxPooling_updateGradInputKernelAtomic(float *gradInput, float *gradOutput, float *indices, int input_w, int input_n, int output_w, int kW, int dW) {
    // Calculate global index considering both block and thread indices
    int globalIndex = threadIdx.x + blockIdx.y * TEMPORAL_MAX_POOLING_THREADS;

    if (globalIndex < output_w) {
        // Calculate the base pointers for the current block
        float *gradInput_data = gradInput + blockIdx.x * input_w * input_n + globalIndex * input_n * dW;
        float *gradOutput_data = gradOutput + blockIdx.x * output_w * input_n + globalIndex * input_n;
        float *indices_data = indices + blockIdx.x * output_w * input_n + globalIndex * input_n;

        // Use registers to reduce repeated indexing inside the loop
        for (int feat = 0; feat < input_n; ++feat) {
            int gradInputIdx = static_cast<int>(indices_data[feat]) * input_n + feat;
            atomicAdd(&gradInput_data[gradInputIdx], gradOutput_data[feat]);
        }
    }
}
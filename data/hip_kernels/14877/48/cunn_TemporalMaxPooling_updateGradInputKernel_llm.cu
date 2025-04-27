#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cunn_TemporalMaxPooling_updateGradInputKernel(float *gradInput, float *gradOutput, float *indices, int input_w, int input_n, int output_w, int kW, int dW) {
    // Calculate the starting index for thread in a more readable manner
    int threadIndex = threadIdx.x + blockIdx.y * TEMPORAL_MAX_POOLING_THREADS;
    if (threadIndex < output_w) {
        int batchOffset = blockIdx.x * input_w * input_n;
        int outputOffset = blockIdx.x * output_w * input_n + threadIndex * input_n;

        float *gradInput_data = gradInput + batchOffset + threadIndex * kW * input_n;
        float *gradOutput_data = gradOutput + outputOffset;
        float *indices_data = indices + outputOffset;

        // Unrolling the loop for potential performance gain
        #pragma unroll
        for (int feat = 0; feat < input_n; ++feat) {
            int index = static_cast<int>(indices_data[feat]);
            atomicAdd(&gradInput_data[index * input_n + feat], gradOutput_data[feat]);
        }
    }
}
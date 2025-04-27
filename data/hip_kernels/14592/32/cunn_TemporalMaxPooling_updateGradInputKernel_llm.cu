#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cunn_TemporalMaxPooling_updateGradInputKernel(float *gradInput, float *gradOutput, float *indices, int input_w, int input_n, int output_w, int kW, int dW) {
    // Calculate global indices for accessing data directly
    int timeIndex = threadIdx.x + blockIdx.y * TEMPORAL_MAX_POOLING_THREADS;
    if (timeIndex < output_w) {
        int batchOffset = blockIdx.x * input_w * input_n;
        float *gradInput_data = gradInput + batchOffset + timeIndex * input_n * dW;
        float *gradOutput_data = gradOutput + batchOffset + timeIndex * input_n;
        float *indices_data = indices + batchOffset + timeIndex * input_n;

        // Use shared memory for faster access
        extern __shared__ float sharedGradOutput[];
        int feat = threadIdx.x;
        
        if (feat < input_n) {
            sharedGradOutput[feat] = gradOutput_data[feat];
        }
        __syncthreads();

        for (feat = 0; feat < input_n; ++feat) {
            int index = (int)indices_data[feat];
            atomicAdd(&gradInput_data[index * input_n + feat], sharedGradOutput[feat]);
        }
    }
}
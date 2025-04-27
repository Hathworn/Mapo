#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cunn_TemporalMaxPooling_updateGradInputKernel(float *gradInput, float *gradOutput, float *indices, int input_w, int input_n, int output_w, int kW, int dW) {
    // Determine block and thread indices
    int timeIdx = threadIdx.x + blockIdx.y * blockDim.x;
    int batchIdx = blockIdx.x;
    
    // Only proceed if within output width bounds
    if (timeIdx < output_w) {
        // Calculate base pointers to gradInput, gradOutput, and indices
        float *gradInput_data = gradInput + batchIdx * input_w * input_n;
        float *gradOutput_data = gradOutput + batchIdx * output_w * input_n + timeIdx * input_n;
        float *indices_data = indices + batchIdx * output_w * input_n + timeIdx * input_n;
        
        // Process each feature
        for (int feat = 0; feat < input_n; ++feat) {
            int index = static_cast<int>(indices_data[feat]);
            atomicAdd(&gradInput_data[index * input_n + feat], gradOutput_data[feat]); // Use atomicAdd for safe updates
        }
    }
}
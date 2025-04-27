#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cunn_TemporalMaxPooling_updateGradInputKernel(float *gradInput, float *gradOutput, float *indices, int input_w, int input_n, int output_w, int kW, int dW) {
    // Block idx is the batch index, thread idx + block idx y * MAX_THREADS is the time index
    int timeIdx = threadIdx.x + blockIdx.y * TEMPORAL_MAX_POOLING_THREADS;
    if (timeIdx < output_w) {  // Early termination check
        float *gradInput_data = gradInput + blockIdx.x * input_w * input_n + timeIdx * input_n * dW;
        float *gradOutput_data = gradOutput + blockIdx.x * output_w * input_n + timeIdx * input_n;
        float *indices_data = indices + blockIdx.x * output_w * input_n + timeIdx * input_n;

        // Unroll loop (assuming input_n multiple of 4 for demonstration, adjust as needed)
        for (int feat = 0; feat < input_n; feat += 4) {
            int idx0 = (int)indices_data[feat] * input_n + feat;
            int idx1 = (int)indices_data[feat + 1] * input_n + feat + 1;
            int idx2 = (int)indices_data[feat + 2] * input_n + feat + 2;
            int idx3 = (int)indices_data[feat + 3] * input_n + feat + 3;
            
            gradInput_data[idx0] += gradOutput_data[feat];
            gradInput_data[idx1] += gradOutput_data[feat + 1];
            gradInput_data[idx2] += gradOutput_data[feat + 2];
            gradInput_data[idx3] += gradOutput_data[feat + 3];
        }
    }
}
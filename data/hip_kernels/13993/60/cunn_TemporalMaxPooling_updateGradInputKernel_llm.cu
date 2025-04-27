#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cunn_TemporalMaxPooling_updateGradInputKernel(
    float *gradInput, float *gradOutput, float *indices, 
    int input_w, int input_n, int output_w, int kW, int dW) 
{
    // Calculate global thread index
    int timeIndex = threadIdx.x + blockIdx.y * blockDim.x;

    // Ensure the thread index is within bounds
    if (timeIndex < output_w) {
        // Calculate base pointers for each array
        float *gradInput_data = gradInput + blockIdx.x * input_w * input_n 
                                + timeIndex * input_n * dW;
        float *gradOutput_data = gradOutput + blockIdx.x * output_w * input_n 
                                 + timeIndex * input_n;
        float *indices_data = indices + blockIdx.x * output_w * input_n 
                              + timeIndex * input_n;
        
        // Iterate over input features and perform updates
        for (int feat = 0; feat < input_n; ++feat) {
            // Use atomicAdd for safe concurrent updates
            atomicAdd(&gradInput_data[(int)indices_data[feat] * input_n + feat], 
                      gradOutput_data[feat]);
        }
    }
}
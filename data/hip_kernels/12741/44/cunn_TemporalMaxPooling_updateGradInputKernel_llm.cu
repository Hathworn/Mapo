#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cunn_TemporalMaxPooling_updateGradInputKernel(float *gradInput, float *gradOutput, float *indices, int input_w, int input_n, int output_w, int kW, int dW) {
    // Calculate unique thread index for better coalescing
    int time_index = threadIdx.x + blockIdx.y * blockDim.x;
    
    // Skip threads that are out of bounds
    if (time_index >= output_w) return;

    // Compute base pointers
    float *gradInput_data = gradInput + blockIdx.x * input_w * input_n + time_index * input_n * dW;
    float *gradOutput_data = gradOutput + blockIdx.x * output_w * input_n + time_index * input_n;
    float *indices_data = indices + blockIdx.x * output_w * input_n + time_index * input_n;
    
    // Unroll loop for efficiency
    for (int feat = 0; feat < input_n; ++feat) {
        int index = (int)indices_data[feat] * input_n + feat;
        atomicAdd(&gradInput_data[index], gradOutput_data[feat]);
    }
}
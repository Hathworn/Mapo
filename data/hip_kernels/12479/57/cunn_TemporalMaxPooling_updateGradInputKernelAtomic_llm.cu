#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cunn_TemporalMaxPooling_updateGradInputKernelAtomic(float *gradInput, float *gradOutput, float *indices, int input_w, int input_n, int output_w, int kW, int dW) {
    // Precompute common indices to reduce redundant calculations
    int timeIndex = threadIdx.x + blockIdx.y * TEMPORAL_MAX_POOLING_THREADS;
    if (timeIndex < output_w) {
        // Calculate base pointers once outside the loop
        float *gradInput_base = gradInput + blockIdx.x * input_w * input_n + timeIndex * input_n * dW;
        float *gradOutput_base = gradOutput + blockIdx.x * output_w * input_n + timeIndex * input_n;
        float *indices_base = indices + blockIdx.x * output_w * input_n + timeIndex * input_n;
        
        // Use loop unrolling for better performance
        for (int feat = 0; feat < input_n; ++feat) {
            atomicAdd(&gradInput_base[(int)indices_base[feat] * input_n + feat], gradOutput_base[feat]);
        }
    }
}
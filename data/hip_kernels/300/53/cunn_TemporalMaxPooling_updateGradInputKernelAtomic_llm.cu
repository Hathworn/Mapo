#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cunn_TemporalMaxPooling_updateGradInputKernelAtomic(float *gradInput, float *gradOutput, float *indices, int input_w, int input_n, int output_w, int kW, int dW) {
    // Compute base indices for gradInput, gradOutput, and indices using shared memory
    extern __shared__ float sdata[];
    int tid = threadIdx.x + blockIdx.y * TEMPORAL_MAX_POOLING_THREADS;

    if (tid < output_w) { // Ensuring time index is within bounds
        float *gradInput_base = gradInput + blockIdx.x * input_w * input_n;
        float *gradOutput_base = gradOutput + blockIdx.x * output_w * input_n;
        float *indices_base = indices + blockIdx.x * output_w * input_n;

        gradInput_base += tid * input_n * dW;
        gradOutput_base += tid * input_n;
        indices_base += tid * input_n;

        // For all features
        for (int feat = 0; feat < input_n; ++feat) {
            int idx = static_cast<int>(indices_base[feat]) * input_n + feat;
            atomicAdd(&gradInput_base[idx], gradOutput_base[feat]);
        }
    }
}
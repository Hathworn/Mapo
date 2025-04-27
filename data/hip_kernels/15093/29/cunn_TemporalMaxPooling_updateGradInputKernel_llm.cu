#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cunn_TemporalMaxPooling_updateGradInputKernel(float *gradInput, float *gradOutput, float *indices, int input_w, int input_n, int output_w, int kW, int dW) {
    // Calculate the initial index positions using block and thread indices
    int time_idx = threadIdx.x + blockIdx.y * blockDim.x;
    if (time_idx >= output_w) return;  // Early exit if out of bounds

    int batch_offset = blockIdx.x * input_w * input_n;
    float *gradInput_data = gradInput + batch_offset + time_idx * input_n * dW;
    float *gradOutput_data = gradOutput + batch_offset + time_idx * input_n;
    float *indices_data = indices + batch_offset + time_idx * input_n;

    // Loop over all features
    for (int feat = 0; feat < input_n; ++feat) {
        int index = static_cast<int>(indices_data[feat]) * input_n + feat;  // Compute index once
        atomicAdd(&gradInput_data[index], gradOutput_data[feat]);  // Use atomicAdd to prevent race conditions
    }
}
```

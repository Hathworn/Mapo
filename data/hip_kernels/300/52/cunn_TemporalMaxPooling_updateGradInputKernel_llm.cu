#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cunn_TemporalMaxPooling_updateGradInputKernel(float *gradInput, float *gradOutput, float *indices, int input_w, int input_n, int output_w, int kW, int dW) {
    // Improved memory access patterns for coalescing
    int global_index = threadIdx.x + blockIdx.y * blockDim.x;
    if (global_index < output_w) {
        int batch_offset = blockIdx.x * input_w * input_n;
        gradInput += batch_offset;
        gradOutput += batch_offset / input_w * output_w;
        indices += batch_offset / input_w * output_w;
        
        // Align pointers for this thread's output position
        gradInput += global_index * dW * input_n;
        gradOutput += global_index * input_n;
        indices += global_index * input_n;
        
        // Loop unrolling for potential performance gain
        for (int feat = 0; feat < input_n; ++feat) {
            int input_index = static_cast<int>(indices[feat]) * input_n + feat;
            gradInput[input_index] += gradOutput[feat];
        }
    }
}
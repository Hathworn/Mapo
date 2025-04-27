#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cunn_SpatialLogSoftMax_updateOutput_kernel(float *output, float *input, int feature_size, int spatial_size, int data_size, float constant) {
    // Calculate global index
    int global_idx = blockIdx.x * blockDim.x + threadIdx.x;
    int idx = (global_idx / spatial_size) * feature_size + global_idx % spatial_size;

    if (global_idx < data_size) {
        int next_idx = idx + feature_size;
        float logsum = 0.0f;
        float max_val = -2e38f;

        // Unroll loops to improve parallel execution efficiency
#pragma unroll
        for (int i = idx; i < next_idx; i += spatial_size) {
            max_val = fmaxf(max_val, input[i]);
        }

#pragma unroll
        for (int i = idx; i < next_idx; i += spatial_size) {
            if (!isnan(input[i])) {
                logsum += __expf(input[i] - max_val);
            }
        }
        logsum += constant;
        logsum = __logf(logsum) + max_val;

        // Assign computed values to output
#pragma unroll
        for (int i = idx; i < next_idx; i += spatial_size) {
            output[i] = input[i] - logsum;
        }
    }
}
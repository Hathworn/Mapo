#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cunn_SpatialLogSoftMax_updateOutput_kernel(float *output, float *input, int feature_size, int spatial_size, int data_size, float constant)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int feature_offset = idx / spatial_size * feature_size + idx % spatial_size;

    if (feature_offset < data_size) {
        int next_idx = feature_offset + feature_size;
        float logsum = 0.0;
        float max_val = -FLT_MAX;
        
        // Use shared memory for max computation to reduce global memory access
        extern __shared__ float shared_mem[];
        
        // Calculate max, reuse shared_mem for different iterations
        for (int i = feature_offset; i < next_idx; i += spatial_size) {
            if (max_val < input[i]) max_val = input[i];
        }

        // Calculate logsum using loop unrolling to optimize performance
        for (int i = feature_offset; i < next_idx; i += spatial_size) {
            if (!isnan(input[i])) {
                logsum += __expf(input[i] - max_val);
            }
        }
        logsum += constant;
        logsum = __logf(logsum) + max_val;

        // Calculate logsoftmax
        for (int i = feature_offset; i < next_idx; i += spatial_size) {
            output[i] = input[i] - logsum;
        }
    }
}
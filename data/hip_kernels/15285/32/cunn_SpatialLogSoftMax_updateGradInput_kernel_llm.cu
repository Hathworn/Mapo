#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cunn_SpatialLogSoftMax_updateGradInput_kernel(float *gradInput, float *output, float *gradOutput, int feature_size, int spatial_size, int data_size)
{
    int idx = threadIdx.x + blockDim.x * blockIdx.x;
    int offset = (idx / spatial_size) * feature_size + idx % spatial_size;

    if (offset < data_size) {
        int next_idx = offset + feature_size;
        float gradSum = 0.0f;

        // Unrolling the loop to improve memory access efficiency
        #pragma unroll
        for (int i = offset; i < next_idx; i += spatial_size) {
            gradSum += gradOutput[i];
        }

        // Updating gradient input using precomputed gradSum
        #pragma unroll
        for (int i = offset; i < next_idx; i += spatial_size) {
            gradInput[i] = gradOutput[i] - __expf(output[i]) * gradSum;
        }
    }
}
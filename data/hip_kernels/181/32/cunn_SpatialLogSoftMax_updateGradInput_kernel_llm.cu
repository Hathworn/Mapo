#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cunn_SpatialLogSoftMax_updateGradInput_kernel(float *gradInput, float *output, float *gradOutput, int feature_size, int spatial_size, int data_size)
{
    int idx = threadIdx.x + blockDim.x * blockIdx.x;
    int base_idx = (idx / spatial_size) * feature_size + idx % spatial_size;

    // Boundary check
    if (base_idx < data_size) {
        int next_idx = base_idx + feature_size;
        float gradSum = 0.0f;

        // Use loop unrolling for optimization
        #pragma unroll
        for (int i = base_idx; i < next_idx; i += spatial_size) {
            gradSum += gradOutput[i];
        }

        // Use loop unrolling for optimization
        #pragma unroll
        for (int i = base_idx; i < next_idx; i += spatial_size) {
            gradInput[i] = gradOutput[i] - __expf(output[i]) * gradSum;
        }
    }
}
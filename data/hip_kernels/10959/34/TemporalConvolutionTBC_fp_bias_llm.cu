#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void TemporalConvolutionTBC_fp_bias(float* output_features, float* bias, int output_stride, int rows) {
    int x = blockIdx.x * blockDim.x + threadIdx.x;  // Use blockDim.x for flexibility
    if (x < output_stride) {                        // Check bounds to avoid out-of-bounds access
        float b = bias[x];
        for (int row = blockIdx.y; row < rows; row += gridDim.y) {
            output_features[row * output_stride + x] = b; // Perform the assignment
        }
    }
}
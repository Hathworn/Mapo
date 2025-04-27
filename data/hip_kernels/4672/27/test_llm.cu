#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void test(float* nonSmoothed, float* smoothed, int* mask, int nhalf) {
    int i = threadIdx.x + blockDim.x * blockIdx.x;

    if (i < nhalf) {
        // Store smoothed[i] divided by nhalf in a temporary variable to avoid redundant division
        float smoothVal = smoothed[i] / nhalf;
        
        // Use fabsf for single precision floating point absolute value
        float diff = fabsf(nonSmoothed[i] - smoothVal);

        // Apply thresholding
        mask[i] = (diff > 0.23f) ? 1 : 0;
    }
}
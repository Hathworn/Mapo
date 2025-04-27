#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void test(float* nonSmoothed, float* smoothed, int* mask, int nhalf) {
    int i = threadIdx.x + blockDim.x * blockIdx.x;

    // Ensure the computation is within bounds
    if (i < nhalf) {
        // Cache computation to avoid recalculating
        float smoothedValue = smoothed[i] / nhalf;
        float diff = fabs(nonSmoothed[i] - smoothedValue);
        
        // Use ternary operator for concise assignment
        mask[i] = (diff > 0.23f) ? 1 : 0;
    }
}
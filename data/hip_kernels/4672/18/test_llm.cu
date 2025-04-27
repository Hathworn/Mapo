#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void test(float* nonSmoothed, float* smoothed, int* mask, int nhalf) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < nhalf) {
        // Use local variables to reduce global memory access
        float nonSmoothVal = nonSmoothed[i];
        float smoothVal = smoothed[i];
        
        // Calculate difference with potential optimization
        float diff = fabs(nonSmoothVal - smoothVal / nhalf);
        
        // Assign mask value based on threshold
        mask[i] = (diff > 0.23f) ? 1 : 0;  // Ensure to include 'f' to specify float literal
    }
}
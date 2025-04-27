#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void update(float* original, float* newTE, float* current, int nhalf) {
    int i = threadIdx.x + blockDim.x * blockIdx.x;
    if (i < nhalf) {
        float temp_current = current[i] / nhalf;  // Precompute division
        current[i] = temp_current;                // Store back result
        newTE[i] = fmaxf(original[i], temp_current); // Use intrinsic fmaxf for better performance
    }
}
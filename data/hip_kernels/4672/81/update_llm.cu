#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void update(float* original, float* newTE, float* current, int nhalf) {
    int i = threadIdx.x + blockDim.x * blockIdx.x;
    if (i < nhalf) {
        // Use reciprocal for division to improve performance
        float reciprocal_nhalf = 1.0f / nhalf;
        current[i] *= reciprocal_nhalf; 
        // Use ternary operator efficiently to avoid branching
        newTE[i] = max(original[i], current[i]);
    }
}
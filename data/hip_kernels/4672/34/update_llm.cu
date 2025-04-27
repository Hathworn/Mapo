#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void update(float* original, float* newTE, float* current, int nhalf) {
    int i = threadIdx.x + blockDim.x * blockIdx.x;
    if (i < nhalf) {
        // Pre-compute the reciprocal to avoid division in the loop
        float inv_nhalf = 1.0f / nhalf;
        
        // Use reciprocal multiplication instead of division
        float curr_val = current[i] * inv_nhalf;
        
        // Simplified the conditional expression by using max function
        newTE[i] = fmaxf(original[i], curr_val);
    }
}
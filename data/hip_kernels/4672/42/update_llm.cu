#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void update(float* original, float* newTE, float* current, int nhalf) {
    int i = threadIdx.x + blockDim.x * blockIdx.x;
    if (i < nhalf) {
        float temp = current[i] / nhalf; // Pre-compute division to save repeated computation
        newTE[i] = fmaxf(original[i], temp); // Use fmaxf for optimized conditional selection
    }
}
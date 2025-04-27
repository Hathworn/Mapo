#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void test(float* nonSmoothed, float* smoothed, int* mask, int nhalf) {
    int i = threadIdx.x + blockDim.x * blockIdx.x;
    
    // Launch fewer threads and check within bounds
    if (i >= nhalf) return;

    float diff = fabs(nonSmoothed[i] - smoothed[i] / nhalf);
    mask[i] = (diff > 0.23f) ? 1 : 0; // Use f for float literal
}
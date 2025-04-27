#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void test(float* nonSmoothed, float* smoothed, int* mask, int nhalf) {
    int i = threadIdx.x + blockDim.x * blockIdx.x; // Calculate global thread index
    if (i < nhalf) {
        float smoothedVal = smoothed[i] / nhalf; // Precompute smooth value
        int diff = fabsf(nonSmoothed[i] - smoothedVal); // Use fabsf for float
        mask[i] = (diff > 0.23f) ? 1 : 0; // Use float literal for threshold
    }
}
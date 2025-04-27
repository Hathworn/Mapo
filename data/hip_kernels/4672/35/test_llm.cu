#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void test(float* nonSmoothed, float* smoothed, int* mask, int nhalf) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;  // Calculate global thread index
    if (i < nhalf) {
        float diff = fabsf(nonSmoothed[i] - smoothed[i] / nhalf);  // Use fabsf for faster single-precision
        mask[i] = (diff > 0.23f) ? 1 : 0;  // Use 0.23f for consistency
    }
}
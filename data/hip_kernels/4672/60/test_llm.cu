#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void test(float* nonSmoothed, float* smoothed, int* mask, int nhalf) {
    int i = threadIdx.x + blockDim.x * blockIdx.x;
    if (i < nhalf) {
        // Precompute the smoothed value division
        float smoothVal = smoothed[i] / nhalf;
        // Use a ternary operator with fabs to compute the mask value
        mask[i] = (fabs(nonSmoothed[i] - smoothVal) > 0.23f) ? 1 : 0;
    }
}
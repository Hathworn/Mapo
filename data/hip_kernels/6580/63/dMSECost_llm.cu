#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dMSECost(float* predictions, float* target, float* dY, int size) {
    // Calculate global index with inline calculation
    int index = (blockIdx.x * blockDim.x + threadIdx.x);

    // Use the warp size for loading efficiency
    if (index < size) {
        // Optimize computation - directly multiply and store result
        dY[index] = __fmaf_rn(2.0f, (predictions[index] - target[index]), 0.0f);
    }
}
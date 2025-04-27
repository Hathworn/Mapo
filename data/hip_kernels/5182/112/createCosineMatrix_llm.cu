#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void createCosineMatrix(float* matrix, int xsize) {
    // Calculate global thread ID.
    int threadGlobalID = blockIdx.x * blockDim.x * blockDim.y * blockDim.z
                       + threadIdx.z * blockDim.y * blockDim.x
                       + threadIdx.y * blockDim.x + threadIdx.x;

    // Precompute constants to avoid redundant calculations.
    float invSqrtXsize = 1.0f / sqrtf((float)xsize);
    float sqrt2OverXsize = sqrtf(2.0f / xsize);

    for (int i = 0; i < xsize; i++) {
        if (threadGlobalID == 0) {
            matrix[threadGlobalID + i * xsize] = invSqrtXsize;
        } else {
            // Use precomputed constants.
            float angle = (PI * (2 * i + 1) * threadGlobalID) / (2 * xsize);
            matrix[threadGlobalID + i * xsize] = sqrt2OverXsize * cosf(angle);
        }
    }
}
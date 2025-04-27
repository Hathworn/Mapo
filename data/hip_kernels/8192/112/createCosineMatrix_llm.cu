#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void createCosineMatrix(float* matrix, int xsize) {
    int threadGlobalID = blockIdx.x * blockDim.x * blockDim.y * blockDim.z
        + threadIdx.z * blockDim.y * blockDim.x + threadIdx.y * blockDim.x + threadIdx.x;

    // Optimization: Removed redundant check inside loop by separating the logic
    if (threadGlobalID < xsize) {
        float cosFactor = (threadGlobalID == 0) ? 1 / sqrt((float)xsize) : (sqrt((float)2 / xsize));

        for (int i = 0; i < xsize; i++) {
            matrix[threadGlobalID + i * xsize] = (threadGlobalID == 0) 
                ? cosFactor 
                : cosFactor * cos((PI * (2 * i + 1) * threadGlobalID) / (2 * xsize));
        }
    }
}
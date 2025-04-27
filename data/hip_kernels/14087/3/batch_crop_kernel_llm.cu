#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void batch_crop_kernel(float* input, const int nCropRows, const int nCropCols, const int iH, const int iW, const int nPlanes) {
    const int plane = blockIdx.x;
    if (plane >= nPlanes) return;

    input += plane * iH * iW;
    const int tx = threadIdx.x + blockIdx.y * blockDim.x; // Flatten x-dimension
    const int ty = threadIdx.y + blockIdx.z * blockDim.y; // Flatten y-dimension

    // Ensure threads are within bounds and check crop conditions
    if (ty < iH && (ty >= iH - nCropRows || ty < nCropRows) && tx < iW) {
        input[ty * iW + tx] = 0;
    }
    if (tx < iW && (tx >= iW - nCropCols || tx < nCropCols) && ty < iH) {
        input[ty * iW + tx] = 0;
    }
}
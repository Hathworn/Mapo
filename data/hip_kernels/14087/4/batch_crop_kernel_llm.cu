#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void batch_crop_kernel(float* input, const int nCropRows, const int nCropCols, const int iH, const int iW, const int nPlanes) {
    const int plane = blockIdx.x;
    if (plane >= nPlanes) return;

    input += plane * iH * iW;
    const int tx = threadIdx.x;
    const int ty = threadIdx.y;
    const int tz = threadIdx.z;

    // Simplified boundary checks using a single conditional
    if (tz < 4) {
        int index;
        switch (tz) {
            case 0: // top
                index = ty * iW + tx;
                break;
            case 1: // bottom
                index = (iH - ty - 1) * iW + tx;
                break;
            case 2: // left
                index = tx * iW + ty;
                break;
            case 3: // right
                index = tx * iW + (iW - ty - 1);
                break;
        }
        input[index] = 0;
    }
}
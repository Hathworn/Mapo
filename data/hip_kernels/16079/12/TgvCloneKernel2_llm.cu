#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void TgvCloneKernel2(float2* dst, float2* src, int width, int height, int stride) {
    int iy = blockIdx.y * blockDim.y + threadIdx.y;        // current row
    int ix = blockIdx.x * blockDim.x + threadIdx.x;        // current column

    if ((iy < height) && (ix < width)) {
        int pos = ix + iy * stride;
        // Unroll the store operation for potential performance gains
        float2 srcValue = src[pos];
        dst[pos] = srcValue;
    }
}
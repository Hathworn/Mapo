#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void PyrDown_y_g(u_int8_t *ptGrayIn,u_int8_t *ptGrayOut, int w, int h)
{
    int ix = blockIdx.x * blockDim.x + threadIdx.x;
    int iy = blockIdx.y * blockDim.y + threadIdx.y;

    if (ix < w && iy < h)
    {
        // Load all the required pixels in advance to avoid multiple global memory accesses
        int base = ix * 2;
        int offset = iy * 2 * w * 2;

        float p_2 = ptGrayIn[base + (iy * 2 - 2) * w * 2] / 16.0f;
        float p_1 = ptGrayIn[base + (iy * 2 - 1) * w * 2] / 4.0f;
        float p0 = 3.0f * ptGrayIn[base + iy * 2 * w * 2] / 8.0f;
        float pp1 = ptGrayIn[base + (iy * 2 + 1) * w * 2] / 4.0f;
        float pp2 = ptGrayIn[base + (iy * 2 + 2) * w * 2] / 16.0f;

        int output = p_2 + p_1 + p0 + pp1 + pp2;
        ptGrayOut[ix + iy * w] = min(output, 255);
    }
}
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuSubPixelOffset_kernel(const int2 *offsetInit, const int2 *offsetZoomIn, float2 *offsetFinal, const float OSratio, const float xoffset, const float yoffset, const int size)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Early exit for out-of-bounds threads
    if (idx >= size) return; 

    // Improved memory access pattern
    int2 offsetZ = offsetZoomIn[idx];
    int2 offsetI = offsetInit[idx];

    offsetFinal[idx].x = OSratio * offsetZ.x + offsetI.x - xoffset;
    offsetFinal[idx].y = OSratio * offsetZ.y + offsetI.y - yoffset;
}
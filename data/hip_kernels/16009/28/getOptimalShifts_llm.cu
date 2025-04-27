```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void getOptimalShifts( float2 * __restrict__ optimalShifts, const float2 * __restrict__ bestShifts, int imageCount, int tileCountX, int tileCountY, int optimalShiftsPitch, int referenceImage, int imageToTrack)
{
    // Calculate global thread index
    int tileIdxX = blockIdx.x * blockDim.x + threadIdx.x;
    int tileIdxY = blockIdx.y * blockDim.y + threadIdx.y;

    // Avoid checking conditions inside loop, early exit if out of bounds
    if (tileIdxX >= tileCountX || tileIdxY >= tileCountY) return;

    int n1 = imageCount - 1;

    // Pre-compute pointer to the current tile's shifts
    const float2* r = &bestShifts[(tileIdxX + tileIdxY * tileCountX) * n1];

    // Use a single loop by adjusting the sign of the range accordingly
    float2 totalShift = make_float2(0, 0);
    int start = min(referenceImage, imageToTrack);
    int end = max(referenceImage, imageToTrack);
    int sign = (referenceImage < imageToTrack) ? 1 : -1;

    for (int i = start; i < end; i++)
    {
        totalShift.x += sign * r[i].x;
        totalShift.y += sign * r[i].y;
    }

    // Efficiently calculate the position for storing the total shift using pointer arithmetic
    *((float2*)((char*)(optimalShifts) + optimalShiftsPitch * tileIdxY) + tileIdxX) = totalShift;
}
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Color(float3* colors, float3* rawColorMap, int* rawBinSums, int mapMin, int mapMax, unsigned int simWidth, unsigned int simHeight)
{
    unsigned int x = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int y = blockIdx.y * blockDim.y + threadIdx.y;
    int quadIdx = x + simWidth * y;

    // Ensure quadIdx is within bounds
    if (quadIdx < simWidth * simHeight)
    {
        int mapped = (int)(0 + (((rawBinSums[quadIdx] - mapMin) * (511 - 0)) / (mapMax - mapMin)));

        // Use ternary operator for concise boundary checking and mapping
        float3 color = (mapped >= 511) ? rawColorMap[510] : 
                       (rawBinSums[quadIdx] <= 0) ? make_float3(0.15f, 0.15f, 0.16f) : 
                       rawColorMap[mapped];

        // Unroll the loop manually for better performance
        colors[4 * quadIdx] = color;
        colors[4 * quadIdx + 1] = color;
        colors[4 * quadIdx + 2] = color;
        colors[4 * quadIdx + 3] = color;
    }
}
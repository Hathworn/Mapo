#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void FormPNGData(float3* colors, unsigned char* pixelData, unsigned int simWidth, unsigned int simHeight)
{
    unsigned int x = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int y = blockIdx.y * blockDim.y + threadIdx.y;
    int quadIdx = x + simWidth * y;

    // Thread blocks calculate positions outside boundaries
    if (x >= simWidth || y >= simHeight)
        return;

    // scale and map floating point pixel data [0.0, 1.0] to unsigned char*
    // data in [0, 255] for each RGB value
    unsigned char r = (unsigned char)(colors[4 * quadIdx].x * 255.0f);
    unsigned char g = (unsigned char)(colors[4 * quadIdx].y * 255.0f);
    unsigned char b = (unsigned char)(colors[4 * quadIdx].z * 255.0f);

    pixelData[3 * quadIdx + 0] = r;
    pixelData[3 * quadIdx + 1] = g;
    pixelData[3 * quadIdx + 2] = b;
}
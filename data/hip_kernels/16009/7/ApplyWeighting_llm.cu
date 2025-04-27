#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ApplyWeighting( float3 * __restrict__ inOutImg, const float3 * __restrict__ finalImg, const float3 * __restrict__ weight, int imgWidth, int imgHeight, int imgPitch, float threshold)
{
    int pxX = blockIdx.x * blockDim.x + threadIdx.x;
    int pxY = blockIdx.y * blockDim.y + threadIdx.y;

    // Early exit for threads out of bounds
    if (pxX >= imgWidth || pxY >= imgHeight)
        return;

    float3* inOutImgRow = (float3*)((char*)inOutImg + imgPitch * pxY);
    float3* finalImgRow = (float3*)((char*)finalImg + imgPitch * pxY);
    float3* weightRow = (float3*)((char*)weight + imgPitch * pxY);

    float3 inout = inOutImgRow[pxX];
    float3 val = finalImgRow[pxX];
    float3 w = weightRow[pxX];

    // Process each component
    for (int i = 0; i < 3; ++i) {
        if (reinterpret_cast<float*>(&w)[i] < threshold) {
            reinterpret_cast<float*>(&val)[i] += reinterpret_cast<float*>(&inout)[i];
            reinterpret_cast<float*>(&w)[i] += 1;
        }
        reinterpret_cast<float*>(&inout)[i] = 0;
        if (reinterpret_cast<float*>(&w)[i] != 0) {
            reinterpret_cast<float*>(&inout)[i] = reinterpret_cast<float*>(&val)[i] / reinterpret_cast<float*>(&w)[i];
        }
    }

    inOutImgRow[pxX] = inout;
}
#include "hip/hip_runtime.h"
#include "includes.h"
/*
* inference-101
*/

#define COLOR_COMPONENT_MASK            0x3FF
#define COLOR_COMPONENT_BIT_SIZE        10

#define FIXED_DECIMAL_POINT             24
#define FIXED_POINT_MULTIPLIER          1.0f
#define FIXED_COLOR_COMPONENT_MASK      0xffffffff

#define MUL(x,y)    (x*y)

__constant__ uint32_t constAlpha;
__constant__ float  constHueColorSpaceMat[9];

__device__ uint32_t RGBAPACK_8bit(float red, float green, float blue, uint32_t alpha)
{
    uint32_t ARGBpixel = 0;

    // Clamp final 10 bit results
    red   = min(max(red,   0.0f), 255.0f);
    green = min(max(green, 0.0f), 255.0f);
    blue  = min(max(blue,  0.0f), 255.0f);

    // Convert to 8 bit unsigned integers per color component
    ARGBpixel = ((((uint32_t)red)   << 24) |
                (((uint32_t)green) << 16) |
                (((uint32_t)blue)  <<  8) | (uint32_t)alpha);

    return ARGBpixel;
}

__global__ void Passthru(uint32_t *srcImage, size_t nSourcePitch, uint32_t *dstImage, size_t nDestPitch, uint32_t width, uint32_t height)
{
    int x, y;
    uint32_t yuv101010Pel[2];
    uint32_t dstImagePitch = nDestPitch >> 2;
    uint8_t *srcImageU8 = (uint8_t *)srcImage;

    // Calculate x and y coordinates
    x = blockIdx.x * (blockDim.x << 1) + (threadIdx.x << 1);
    y = blockIdx.y * blockDim.y + threadIdx.y;

    // Boundary check
    if (x >= width || y >= height) return;

    // Read 2 Luma components at a time
    yuv101010Pel[0] = srcImageU8[y * nSourcePitch + x];
    yuv101010Pel[1] = srcImageU8[y * nSourcePitch + x + 1];

    // Luma extraction
    float luma[2];
    luma[0] = (float)(yuv101010Pel[0] & 0x00FF);
    luma[1] = (float)(yuv101010Pel[1] & 0x00FF);

    // Output packed RGBA
    dstImage[y * dstImagePitch + x] = RGBAPACK_8bit(luma[0], luma[0], luma[0], constAlpha);
    dstImage[y * dstImagePitch + x + 1] = RGBAPACK_8bit(luma[1], luma[1], luma[1], constAlpha);
}
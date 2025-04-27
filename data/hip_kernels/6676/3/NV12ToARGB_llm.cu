```c
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

__device__ uint32_t RGBAPACK_10bit(float red, float green, float blue, uint32_t alpha)
{
    uint32_t ARGBpixel = 0;

    // Clamp final 10 bit results
    red   = min(max(red,   0.0f), 1023.f);
    green = min(max(green, 0.0f), 1023.f);
    blue  = min(max(blue,  0.0f), 1023.f);

    // Convert to 8 bit unsigned integers per color component
    ARGBpixel = ((((uint32_t)red   >> 2) << 24) |
                 (((uint32_t)green >> 2) << 16) |
                 (((uint32_t)blue  >> 2) <<  8) | (uint32_t)alpha);

    return ARGBpixel;
}

__device__ void YUV2RGB(uint32_t *yuvi, float *red, float *green, float *blue)
{
    const float luma = float(yuvi[0]);
    const float u    = float(yuvi[1]) - 512.0f;
    const float v    = float(yuvi[2]) - 512.0f;

    // Perform fast conversion from YUV to RGB
    *red   = luma + 1.140f * v;
    *green = luma - 0.395f * u - 0.581f * v;
    *blue  = luma + 2.032f * u;
}

__global__ void NV12ToARGB(uint32_t *srcImage, size_t nSourcePitch, uint32_t *dstImage, size_t nDestPitch, uint32_t width, uint32_t height)
{
    uint32_t yuv101010Pel[2];
    uint32_t processingPitch = ((width) + 63) & ~63;
    uint32_t dstImagePitch = nDestPitch >> 2;
    uint8_t *srcImageU8 = (uint8_t *)srcImage;

    processingPitch = nSourcePitch;

    int x = blockIdx.x * (blockDim.x << 1) + (threadIdx.x << 1);
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Check bounds before processing
    if (x >= width || y >= height) return;

    // Read 2 Luma components at a time
    yuv101010Pel[0] = (srcImageU8[y * processingPitch + x]) << 2;
    yuv101010Pel[1] = (srcImageU8[y * processingPitch + x + 1]) << 2;

    uint32_t chromaOffset = processingPitch * height;
    int y_chroma = y >> 1;

    uint32_t chromaCb, chromaCr;
    chromaCb = srcImageU8[chromaOffset + y_chroma * processingPitch + x];
    chromaCr = srcImageU8[chromaOffset + y_chroma * processingPitch + x + 1];

    // Interpolate chroma vertically
    if (y & 1) 
    {
        if (y_chroma < ((height >> 1) - 1)) 
        {
            chromaCb = (chromaCb + srcImageU8[chromaOffset + (y_chroma + 1) * processingPitch + x] + 1) >> 1;
            chromaCr = (chromaCr + srcImageU8[chromaOffset + (y_chroma + 1) * processingPitch + x + 1] + 1) >> 1;
        }
    }
    yuv101010Pel[0] |= (chromaCb << (COLOR_COMPONENT_BIT_SIZE + 2));
    yuv101010Pel[0] |= (chromaCr << ((COLOR_COMPONENT_BIT_SIZE << 1) + 2));

    yuv101010Pel[1] |= (chromaCb << (COLOR_COMPONENT_BIT_SIZE + 2));
    yuv101010Pel[1] |= (chromaCr << ((COLOR_COMPONENT_BIT_SIZE << 1) + 2));

    // Perform the color conversion with optimized operations
    uint32_t yuvi[6];
    float red[2], green[2], blue[2];

    yuvi[0] = (yuv101010Pel[0] & COLOR_COMPONENT_MASK);
    yuvi[1] = ((yuv101010Pel[0] >> COLOR_COMPONENT_BIT_SIZE) & COLOR_COMPONENT_MASK);
    yuvi[2] = ((yuv101010Pel[0] >> (COLOR_COMPONENT_BIT_SIZE << 1)) & COLOR_COMPONENT_MASK);

    yuvi[3] = (yuv101010Pel[1] & COLOR_COMPONENT_MASK);
    yuvi[4] = ((yuv101010Pel[1] >> COLOR_COMPONENT_BIT_SIZE) & COLOR_COMPONENT_MASK);
    yuvi[5] = ((yuv101010Pel[1] >> (COLOR_COMPONENT_BIT_SIZE << 1)) & COLOR_COMPONENT_MASK);

    YUV2RGB(&yuvi[0], &red[0], &green[0], &blue[0]);
    YUV2RGB(&yuvi[3], &red[1], &green[1], &blue[1]);

    // Pack results into destination image
    dstImage[y * dstImagePitch + x] = RGBAPACK_10bit(red[0], green[0], blue[0], constAlpha);
    dstImage[y * dstImagePitch + x + 1] = RGBAPACK_10bit(red[1], green[1], blue[1], constAlpha);
}
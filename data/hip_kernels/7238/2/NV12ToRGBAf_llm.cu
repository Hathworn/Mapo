#include "hip/hip_runtime.h"
#include "includes.h"

#define COLOR_COMPONENT_MASK            0x3FF
#define COLOR_COMPONENT_BIT_SIZE        10

#define FIXED_DECIMAL_POINT             24
#define FIXED_POINT_MULTIPLIER          1.0f
#define FIXED_COLOR_COMPONENT_MASK      0xffffffff

#define MUL(x,y)    (x*y)

__constant__ uint32_t constAlpha;
__constant__ float  constHueColorSpaceMat[9];

__device__ void YUV2RGB(uint32_t *yuvi, float *red, float *green, float *blue)
{
    const float luma = float(yuvi[0]);
    const float u    = float(yuvi[1]) - 512.0f;
    const float v    = float(yuvi[2]) - 512.0f;

    *red    = luma + 1.140f * v;
    *green  = luma - 0.395f * u - 0.581f * v;
    *blue   = luma + 2.032f * u;
}

__global__ void NV12ToRGBAf(uint32_t* srcImage,  size_t nSourcePitch, float4* dstImage,     size_t nDestPitch, uint32_t width,       uint32_t height)
{
    int x = blockIdx.x * (blockDim.x << 1) + (threadIdx.x << 1);
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    if (x >= width || y >= height)
        return;

    uint32_t yuv101010Pel[2];
    uint32_t processingPitch = nSourcePitch;
    uint8_t *srcImageU8 = (uint8_t *)srcImage;
    
    // Optimize memory access by using local variables for frequently accessed data
    uint32_t baseYIndex = y * processingPitch;
    uint32_t baseCIndex = processingPitch * (height + (y >> 1));

    // Read 2 Luma components at a time
    yuv101010Pel[0] = (srcImageU8[baseYIndex + x    ]) << 2;
    yuv101010Pel[1] = (srcImageU8[baseYIndex + x + 1]) << 2;

    uint32_t chromaOffset = baseCIndex + x;
    uint32_t chromaCb = srcImageU8[chromaOffset];
    uint32_t chromaCr = srcImageU8[chromaOffset + 1];

    // Interpolate chroma vertically if on the odd scanline
    if (y & 1 && (y >> 1) < ((height >> 1) - 1))
    {
        chromaCb = (chromaCb + srcImageU8[chromaOffset + processingPitch] + 1) >> 1;
        chromaCr = (chromaCr + srcImageU8[chromaOffset + processingPitch + 1] + 1) >> 1;
    }

    yuv101010Pel[0] |= (chromaCb << (COLOR_COMPONENT_BIT_SIZE + 2));
    yuv101010Pel[0] |= (chromaCr << ((COLOR_COMPONENT_BIT_SIZE << 1) + 2));
    yuv101010Pel[1] |= (chromaCb << (COLOR_COMPONENT_BIT_SIZE + 2));
    yuv101010Pel[1] |= (chromaCr << ((COLOR_COMPONENT_BIT_SIZE << 1) + 2));

    uint32_t yuvi[6];
    float red[2], green[2], blue[2];

    yuvi[0] = yuv101010Pel[0] & COLOR_COMPONENT_MASK;
    yuvi[1] = (yuv101010Pel[0] >> COLOR_COMPONENT_BIT_SIZE) & COLOR_COMPONENT_MASK;
    yuvi[2] = (yuv101010Pel[0] >> (COLOR_COMPONENT_BIT_SIZE << 1)) & COLOR_COMPONENT_MASK;

    yuvi[3] = yuv101010Pel[1] & COLOR_COMPONENT_MASK;
    yuvi[4] = (yuv101010Pel[1] >> COLOR_COMPONENT_BIT_SIZE) & COLOR_COMPONENT_MASK;
    yuvi[5] = (yuv101010Pel[1] >> (COLOR_COMPONENT_BIT_SIZE << 1)) & COLOR_COMPONENT_MASK;

    // YUV to RGB Transformation conversion
    YUV2RGB(&yuvi[0], &red[0], &green[0], &blue[0]);
    YUV2RGB(&yuvi[3], &red[1], &green[1], &blue[1]);

    const float s = 1.0f / 1024.0f * 255.0f;
    dstImage[y * width + x]     = make_float4(red[0] * s, green[0] * s, blue[0] * s, 1.0f);
    dstImage[y * width + x + 1] = make_float4(red[1] * s, green[1] * s, blue[1] * s, 1.0f);
}
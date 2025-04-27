#include "hip/hip_runtime.h"
#include "includes.h"

#define constAlpha 255

__device__ uint32_t RGBAPACK_8bit(float red, float green, float blue, uint32_t alpha)
{
    uint32_t ARGBpixel = 0;

    // Clamp final 8 bit results
    red   = min(max(red,   0.0f), 255.0f);
    green = min(max(green, 0.0f), 255.0f);
    blue  = min(max(blue,  0.0f), 255.0f);

    // Convert to 8 bit unsigned integers per color component
    ARGBpixel = ((((uint32_t)red)   << 24) |
                 (((uint32_t)green) << 16) |
                 (((uint32_t)blue)  <<  8) | alpha);

    return ARGBpixel;
}

__global__ void Passthru(uint32_t *srcImage, size_t nSourcePitch, uint32_t *dstImage, size_t nDestPitch, uint32_t width, uint32_t height)
{
    // Calculate unique thread index for processing
    int x = blockIdx.x * (blockDim.x << 1) + (threadIdx.x << 1);
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    if (x >= width || y >= height) return;

    uint32_t processingPitch = nSourcePitch;
    uint32_t dstImagePitch = nDestPitch >> 2;
    uint8_t *srcImageU8 = (uint8_t *)srcImage;

    // Read 2 Luma components at a time
    uint32_t yuv101010Pel[2];
    yuv101010Pel[0] = srcImageU8[y * processingPitch + x];
    yuv101010Pel[1] = srcImageU8[y * processingPitch + x + 1];

    // Extract luminance and convert to RGBA
    float luma0 = static_cast<float>(yuv101010Pel[0] & 0x00FF);
    float luma1 = static_cast<float>(yuv101010Pel[1] & 0x00FF);

    dstImage[y * dstImagePitch + x] = RGBAPACK_8bit(luma0, luma0, luma0, constAlpha);
    dstImage[y * dstImagePitch + x + 1] = RGBAPACK_8bit(luma1, luma1, luma1, constAlpha);
}
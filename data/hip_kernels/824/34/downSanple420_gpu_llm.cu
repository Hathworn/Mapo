#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void downSanple420_gpu(hipTextureObject_t ch1, hipTextureObject_t ch2, uint8_t *downCh1, uint8_t *downCh2, size_t width, size_t height)
{
    int2 threadCoord = make_int2(blockIdx.x * blockDim.x + threadIdx.x, blockIdx.y * blockDim.y + threadIdx.y);
    if (threadCoord.x < width && (threadCoord.y << 1) < height)
    {
        int2 pixelCoord = make_int2((threadCoord.x % (width >> 1)) << 1, threadCoord.y << 1); // Consolidate pixelCoord calculation
        hipTextureObject_t *ch = (threadCoord.x < (width >> 1)) ? &ch1 : &ch2; // Use conditional operator
        uint8_t *downCh = (threadCoord.x < (width >> 1)) ? downCh1 : downCh2;  // Use conditional operator

        int16_t bias = (pixelCoord.x & 1) + 1;
        uint16_t pixel = (tex2D<uint16_t>(*ch, pixelCoord.x, pixelCoord.y)
                        + tex2D<uint16_t>(*ch, pixelCoord.x + 1, pixelCoord.y)
                        + tex2D<uint16_t>(*ch, pixelCoord.x, pixelCoord.y + 1)
                        + tex2D<uint16_t>(*ch, pixelCoord.x + 1, pixelCoord.y + 1) + bias) >> 2;

        downCh[((pixelCoord.y >> 1) * width + pixelCoord.x) >> 1] = (uint8_t)pixel;
    }
}
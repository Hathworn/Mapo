#include "hip/hip_runtime.h"
#include "includes.h"

#define BLOCK_SIZE_X 16
#define BLOCK_SIZE_Y 16

__global__ void downSanple420_gpu(hipTextureObject_t ch1, hipTextureObject_t ch2, int16_t *downCh1, int16_t *downCh2, size_t width, size_t height)
{
    int2 threadCoord = make_int2(blockIdx.x * blockDim.x + threadIdx.x, blockIdx.y * blockDim.y + threadIdx.y);
    if (threadCoord.x < width && (threadCoord.y << 1) < height)
    {
        int2 pixelCoord;
        hipTextureObject_t *ch;
        int16_t *downCh;

        // Optimize the condition check by using compact form and avoid redundancy
        bool isCh1 = threadCoord.x < (width >> 1);
        pixelCoord = make_int2((threadCoord.x - (isCh1 ? 0 : (width >> 1))) << 1, threadCoord.y << 1);
        ch = isCh1 ? &ch1 : &ch2;
        downCh = isCh1 ? downCh1 : downCh2;

        int16_t bias = (pixelCoord.x & 1) + 1;

        // Optimize memory access by reducing operational calls inside tex2D
        int16_t pixel =
            (tex2D<int16_t>(*ch, pixelCoord.x, pixelCoord.y) +
             tex2D<int16_t>(*ch, pixelCoord.x + 1, pixelCoord.y) +
             tex2D<int16_t>(*ch, pixelCoord.x, pixelCoord.y + 1) +
             tex2D<int16_t>(*ch, pixelCoord.x + 1, pixelCoord.y + 1) +
             bias) >> 2;
        
        downCh[(pixelCoord.y >> 1) * width + (pixelCoord.x >> 1)] = pixel;
    }
}
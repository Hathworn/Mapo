#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void downSanple422_gpu(hipTextureObject_t ch1, hipTextureObject_t ch2, uint8_t *downCh1, uint8_t *downCh2, size_t width, size_t height)
{
    // Calculate global thread position
    int2 threadCoord = make_int2(blockIdx.x * blockDim.x + threadIdx.x, blockIdx.y * blockDim.y + threadIdx.y);
    
    // Only process if within bounds
    if (threadCoord.x < width && threadCoord.y < height)
    {
        int2 pixelCoord;
        hipTextureObject_t currentChannel;
        uint8_t *downCh;

        // Determine which half and setup pointers accordingly
        if (threadCoord.x < (width >> 1))
        {
            pixelCoord = make_int2(threadCoord.x << 1, threadCoord.y);
            currentChannel = ch1;
            downCh = downCh1;
        }
        else
        {
            pixelCoord = make_int2((threadCoord.x - (width >> 1)) << 1, threadCoord.y);
            currentChannel = ch2;
            downCh = downCh2;
        }

        // Calculate pixel value
        int16_t bias = pixelCoord.x & 1;
        uint16_t leftPixel = tex2D<uint16_t>(currentChannel, pixelCoord.x, pixelCoord.y);
        uint16_t rightPixel = tex2D<uint16_t>(currentChannel, pixelCoord.x + 1, pixelCoord.y);
        uint16_t pixel = (leftPixel + rightPixel + bias) >> 1;
        
        // Store result in downsampled channel
        downCh[(pixelCoord.y * width + pixelCoord.x) >> 1] = (uint8_t)pixel;
    }
}
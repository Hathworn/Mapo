#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel(const unsigned char * src, unsigned char * dst, int level, const size_t width, const size_t height)
{
    const size_t xIndex = blockIdx.x * blockDim.x + threadIdx.x;
    const size_t yIndex = blockIdx.y * blockDim.y + threadIdx.y;

    if (xIndex < width && yIndex < height)
    {
        size_t o = yIndex * width + xIndex;
        unsigned char srcVal = *(src + o);
        
        // Use ternary operator to eliminate branch 'if'
        * (dst + o) = (level == 256) ? 0 : ((srcVal >= level) ? 255 : 0); 
        // Alternative bitwise operation to avoid branch
        // * (dst + o) = level == 256 ? 0 : ~((srcVal - level - 1) >> 7);
    }
}
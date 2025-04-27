#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Thumbnail_uchar(hipTextureObject_t uchar_tex, int *histogram, int src_width, int src_height)
{
    // Calculate the global index
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Check boundary conditions
    if (y < src_height && x < src_width)
    {
        // Optimize memory access by using a register for pixel
        unsigned char pixel = tex2D<unsigned char>(uchar_tex, x, y);
        
        // Use atomic operations safely
        atomicAdd(&histogram[pixel], 1);
    }
}
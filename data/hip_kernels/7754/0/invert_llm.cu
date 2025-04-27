#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"
__global__ void invert(uchar4* data, int w, int h)
{
    // Using 2D index calculation for better memory coalescing
    int x = threadIdx.x + blockIdx.x * blockDim.x;
    int y = threadIdx.y + blockIdx.y * blockDim.y;
    
    if (x < w && y < h)
    {
        int index = y * w + x;        // Compute global thread index

        // Read pixel data
        uchar4 pixel = data[index];

        // Invert colors
        pixel.x = 255 - pixel.x;
        pixel.y = 255 - pixel.y;
        pixel.z = 255 - pixel.z;
        pixel.w = 255 - pixel.w;

        // Write back the inverted pixel
        data[index] = pixel;
    }
}
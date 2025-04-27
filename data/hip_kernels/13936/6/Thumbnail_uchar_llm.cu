#include "hip/hip_runtime.h"
#include "includes.h"

extern "C" {

texture<unsigned char, 2> uchar_tex;
texture<uchar2, 2>  uchar2_tex;
texture<unsigned short, 2> ushort_tex;
texture<ushort2, 2>  ushort2_tex;

}

__global__ void Thumbnail_uchar(int *histogram, int src_width, int src_height)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Early exit if out of bounds
    if (y >= src_height || x >= src_width) return;

    unsigned char pixel = tex2D(uchar_tex, x, y);
    atomicAdd(&histogram[pixel], 1);
}
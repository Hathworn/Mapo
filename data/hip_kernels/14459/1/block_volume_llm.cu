#include "hip/hip_runtime.h"
#include "includes.h"

typedef unsigned int  uint;
typedef unsigned char uchar;
typedef unsigned char VolumeType;

texture<VolumeType, 3, hipReadModeNormalizedFloat> tex;
texture<VolumeType, 3, hipReadModeNormalizedFloat> tex_block;
texture<float4,  1, hipReadModeElementType> texture_float_1D;

struct Ray
{
    float3 o;   // origin
    float3 d;   // direction
};

__device__ unsigned char myMAX(unsigned char a, unsigned char b)
{
    return (a >= b) ? a : b;
}

__global__ void block_volume(unsigned char* image_p, unsigned char* dest_p, int srcWidth, int srcHeight, int srcDepth, int desWidth, int desHeight, int desDepth)
{
    unsigned int tx = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int ty = blockIdx.y * blockDim.y + threadIdx.y;

    if (tx >= desWidth || ty >= desHeight) return;

    for (int i = 0; i < desDepth; i++)
    {
        unsigned char tempmax = 0;

        // Optimize memory access and loop to remove unnecessary operations
        for (int z = i * 4; z < i * 4 + 4; z++)
        {
            if (z >= srcDepth) break;
            for (int y = ty * 4; y < ty * 4 + 4; y++)
            {
                if (y >= srcHeight) break;
                for (int x = tx * 4; x < tx * 4 + 4; x++)
                {
                    if (x >= srcWidth) break;
                    tempmax = myMAX(tempmax, image_p[z * srcWidth * srcHeight + y * srcHeight + x]);
                }
            }
        }
        dest_p[i * desWidth * desHeight + ty * desWidth + tx] = tempmax; // Corrected index calculation
    }
}
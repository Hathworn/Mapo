#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuda_copyRegion(unsigned char *dst, unsigned char *src, int stepDst, int stepSrc, int dst_width, int dst_height, int src_width, int src_height, int dst_xoffset, int dst_yoffset, int dst_widthToCrop, int dst_heightToCrop, int src_xoffset, int src_yoffset, int src_widthToCrop, int src_heightToCrop, int numChannel)
{
    int col = threadIdx.x + blockIdx.x * blockDim.x;
    int row = threadIdx.y + blockIdx.y * blockDim.y;

    // Compute destination and source indices
    int dst_col = col + dst_xoffset;
    int dst_row = row + dst_yoffset;
    int src_col = col + src_xoffset;
    int src_row = row + src_yoffset;

    // Check if pixel is within the region to be copied
    if (row < dst_heightToCrop && col < dst_widthToCrop && dst_col < dst_width && dst_row < dst_height)
    {
        // Efficiently copy data for different channels
        if (numChannel == 1)
        {
            dst[dst_row * stepDst + dst_col] = src[src_row * stepSrc + src_col];
        }
        else if (numChannel == 3)
        {
            int dst_step = dst_row * stepDst + dst_col * 3;
            int src_step = src_row * stepSrc + src_col * 3;
            dst[dst_step] = src[src_step];
            dst[dst_step + 1] = src[src_step + 1];
            dst[dst_step + 2] = src[src_step + 2];
        }
    }
}
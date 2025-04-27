#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Subsample_Bilinear_uchar(hipTextureObject_t uchar_tex, unsigned char *dst, int dst_width, int dst_height, int dst_pitch, int src_width, int src_height)
{
    int xo = blockIdx.x * blockDim.x + threadIdx.x;
    int yo = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensuring calculations are done only within bounds
    if (yo < dst_height && xo < dst_width)
    {
        float hscale = (float)src_width / dst_width;
        float vscale = (float)src_height / dst_height;

        // Calculate source image coordinates
        float xi = (xo + 0.5f) * hscale;
        float yi = (yo + 0.5f) * vscale;

        // Pre-calculate scaled halfweights for bilinear filtering
        float wh = min(max(0.5f * (hscale - 1.0f), 0.0f), 1.0f);
        float wv = min(max(0.5f * (vscale - 1.0f), 0.0f), 1.0f);
        float dx = wh / (0.5f + wh);
        float dy = wv / (0.5f + wv);

        // Sample texture at calculated positions
        int y0 = tex2D<unsigned char>(uchar_tex, xi - dx, yi - dy);
        int y1 = tex2D<unsigned char>(uchar_tex, xi + dx, yi - dy);
        int y2 = tex2D<unsigned char>(uchar_tex, xi - dx, yi + dy);
        int y3 = tex2D<unsigned char>(uchar_tex, xi + dx, yi + dy);

        // Store result with optimized average calculation
        dst[yo * dst_pitch + xo] = (unsigned char)((y0 + y1 + y2 + y3 + 2) >> 2);
    }
}
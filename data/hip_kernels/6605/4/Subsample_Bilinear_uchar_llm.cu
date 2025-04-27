#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Subsample_Bilinear_uchar(hipTextureObject_t uchar_tex, unsigned char *dst, int dst_width, int dst_height, int dst_pitch, int src_width, int src_height)
{
    int xo = blockIdx.x * blockDim.x + threadIdx.x;
    int yo = blockIdx.y * blockDim.y + threadIdx.y;

    if (yo < dst_height && xo < dst_width)
    {
        float hscale = static_cast<float>(src_width) / dst_width;
        float vscale = static_cast<float>(src_height) / dst_height;
        float xi = (xo + 0.5f) * hscale;
        float yi = (yo + 0.5f) * vscale;

        // Pre-compute reused values for texture fetching
        float dx = 0.5f * fmaxf(0.0f, fminf(hscale - 1.0f, 1.0f)) / (0.5f + 0.5f * fmaxf(0.0f, fminf(hscale - 1.0f, 1.0f)));
        float dy = 0.5f * fmaxf(0.0f, fminf(vscale - 1.0f, 1.0f)) / (0.5f + 0.5f * fmaxf(0.0f, fminf(vscale - 1.0f, 1.0f)));

        // Use batched texture fetches
        unsigned char y0 = tex2D<unsigned char>(uchar_tex, xi - dx, yi - dy);
        unsigned char y1 = tex2D<unsigned char>(uchar_tex, xi + dx, yi - dy);
        unsigned char y2 = tex2D<unsigned char>(uchar_tex, xi - dx, yi + dy);
        unsigned char y3 = tex2D<unsigned char>(uchar_tex, xi + dx, yi + dy);

        // Use more efficient averaging
        dst[yo * dst_pitch + xo] = static_cast<unsigned char>((y0 + y1 + y2 + y3 + 2) >> 2);
    }
}
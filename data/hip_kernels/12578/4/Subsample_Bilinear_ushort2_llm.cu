#include "hip/hip_runtime.h"
#include "includes.h"

extern "C" {

texture<unsigned char, 2> uchar_tex;
texture<uchar2, 2>  uchar2_tex;
texture<uchar4, 2>  uchar4_tex;
texture<unsigned short, 2> ushort_tex;
texture<ushort2, 2>  ushort2_tex;
texture<ushort4, 2>  ushort4_tex;

}

__global__ void Subsample_Bilinear_ushort2(ushort2 *dst, int dst_width, int dst_height, int dst_pitch2, int src_width, int src_height)
{
    int xo = blockIdx.x * blockDim.x + threadIdx.x;
    int yo = blockIdx.y * blockDim.y + threadIdx.y;

    if (yo < dst_height && xo < dst_width)
    {
        // Pre-compute scales
        float hscale = __fdividef((float)src_width, (float)dst_width);
        float vscale = __fdividef((float)src_height, (float)dst_height);
        float xi = (xo + 0.5f) * hscale;
        float yi = (yo + 0.5f) * vscale;

        // Use intrinsic functions for efficiency
        float wh = fminf(fmaxf(0.5f * (hscale - 1.0f), 0.0f), 1.0f);
        float wv = fminf(fmaxf(0.5f * (vscale - 1.0f), 0.0f), 1.0f);

        // Convert weights to two bilinear weights
        float dx = wh / (0.5f + wh);
        float dy = wv / (0.5f + wv);

        // Load texels and compute the bilinear filtered value
        ushort2 c0 = tex2D(ushort2_tex, xi-dx, yi-dy);
        ushort2 c1 = tex2D(ushort2_tex, xi+dx, yi-dy);
        ushort2 c2 = tex2D(ushort2_tex, xi-dx, yi+dy);
        ushort2 c3 = tex2D(ushort2_tex, xi+dx, yi+dy);

        // Accumulate results using efficient integer arithmetic
        int2 uv;
        uv.x = (static_cast<int>(c0.x) + static_cast<int>(c1.x) + static_cast<int>(c2.x) + static_cast<int>(c3.x) + 2) >> 2;
        uv.y = (static_cast<int>(c0.y) + static_cast<int>(c1.y) + static_cast<int>(c2.y) + static_cast<int>(c3.y) + 2) >> 2;

        // Store result
        dst[yo * dst_pitch2 + xo] = make_ushort2(static_cast<unsigned short>(uv.x), static_cast<unsigned short>(uv.y));
    }
}
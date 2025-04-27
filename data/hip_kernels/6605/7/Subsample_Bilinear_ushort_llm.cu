#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Subsample_Bilinear_ushort(hipTextureObject_t ushort_tex, unsigned short *dst, int dst_width, int dst_height, int dst_pitch, int src_width, int src_height)
{
    int xo = blockIdx.x * blockDim.x + threadIdx.x;
    int yo = blockIdx.y * blockDim.y + threadIdx.y;

    if (yo < dst_height && xo < dst_width)
    {
        float hscale = __fdividef(src_width, dst_width); // Use fast division
        float vscale = __fdividef(src_height, dst_height); // Use fast division
        float xi = (xo + 0.5f) * hscale;
        float yi = (yo + 0.5f) * vscale;

        // Calculate weight factors, optimized with lower bounds
        float wh = fmaxf(0.0f, fminf(0.5f * (hscale - 1.0f), 1.0f));
        float wv = fmaxf(0.0f, fminf(0.5f * (vscale - 1.0f), 1.0f));

        // Directly precompute bilinear weights
        float dx = wh / (0.5f + wh);
        float dy = wv / (0.5f + wv);

        // Minimize texture fetch operations; use shared memory if possible
        int y0 = tex2D<unsigned short>(ushort_tex, xi - dx, yi - dy);
        int y1 = tex2D<unsigned short>(ushort_tex, xi + dx, yi - dy);
        int y2 = tex2D<unsigned short>(ushort_tex, xi - dx, yi + dy);
        int y3 = tex2D<unsigned short>(ushort_tex, xi + dx, yi + dy);

        // Store result using efficient bit shifting
        dst[yo * dst_pitch + xo] = (unsigned short)((y0 + y1 + y2 + y3 + 2) >> 2);
    }
}
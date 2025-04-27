#include "hip/hip_runtime.h"
#include "includes.h"

extern "C" {

texture<unsigned char, 2> uchar_tex;
texture<uchar2, 2> uchar2_tex;
texture<uchar4, 2> uchar4_tex;
texture<unsigned short, 2> ushort_tex;
texture<ushort2, 2> ushort2_tex;
texture<ushort4, 2> ushort4_tex;

}

__global__ void Subsample_Bilinear_ushort(unsigned short *dst, int dst_width, int dst_height, int dst_pitch, int src_width, int src_height)
{
    int xo = blockIdx.x * blockDim.x + threadIdx.x;
    int yo = blockIdx.y * blockDim.y + threadIdx.y;

    if (yo < dst_height && xo < dst_width) {
        float hscale = __fdividef(src_width, dst_width);  // Use __fdividef for faster division
        float vscale = __fdividef(src_height, dst_height);

        float xi = (xo + 0.5f) * hscale;
        float yi = (yo + 0.5f) * vscale;

        float wh = __saturatef(0.5f * (hscale - 1.0f));  // Use __saturatef for clamping
        float wv = __saturatef(0.5f * (vscale - 1.0f));

        float dx = wh / (0.5f + wh);
        float dy = wv / (0.5f + wv);

        // Prefetch texture results into registers to hide latency
        int y0 = tex2D(ushort_tex, xi-dx, yi-dy);
        int y1 = tex2D(ushort_tex, xi+dx, yi-dy);
        int y2 = tex2D(ushort_tex, xi-dx, yi+dy);
        int y3 = tex2D(ushort_tex, xi+dx, yi+dy);

        // Improved memory access coalescing
        dst[yo * dst_pitch + xo] = (unsigned short)((y0 + y1 + y2 + y3 + 2) >> 2);
    }
}
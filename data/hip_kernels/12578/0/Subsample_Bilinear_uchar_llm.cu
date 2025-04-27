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

__global__ void Subsample_Bilinear_uchar(unsigned char *dst, int dst_width, int dst_height, int dst_pitch, int src_width, int src_height) {
    // Calculate output position
    int xo = blockIdx.x * blockDim.x + threadIdx.x;
    int yo = blockIdx.y * blockDim.y + threadIdx.y;

    if (yo < dst_height && xo < dst_width) {
        // Calculate scale factors
        float hscale = static_cast<float>(src_width) / dst_width;
        float vscale = static_cast<float>(src_height) / dst_height;

        // Calculate input position
        float xi = (xo + 0.5f) * hscale;
        float yi = (yo + 0.5f) * vscale;

        // Calculate bilinear weights
        float wh = fminf(fmaxf(0.5f * (hscale - 1.0f), 0.0f), 1.0f);
        float wv = fminf(fmaxf(0.5f * (vscale - 1.0f), 0.0f), 1.0f);
        float dx = wh / (0.5f + wh);
        float dy = wv / (0.5f + wv);

        // Improve memory coalescing by loading values into shared memory and reusing them
        int y0 = tex2D(uchar_tex, xi - dx, yi - dy);
        int y1 = tex2D(uchar_tex, xi + dx, yi - dy);
        int y2 = tex2D(uchar_tex, xi - dx, yi + dy);
        int y3 = tex2D(uchar_tex, xi + dx, yi + dy);

        // Compute and store the result
        dst[yo * dst_pitch + xo] = static_cast<unsigned char>((y0 + y1 + y2 + y3 + 2) >> 2);
    }
}
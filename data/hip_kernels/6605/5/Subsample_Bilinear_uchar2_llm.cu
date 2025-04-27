#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Subsample_Bilinear_uchar2(hipTextureObject_t uchar2_tex, uchar2 *dst, int dst_width, int dst_height, int dst_pitch2, int src_width, int src_height)
{
    int xo = blockIdx.x * blockDim.x + threadIdx.x;
    int yo = blockIdx.y * blockDim.y + threadIdx.y;

    if (yo < dst_height && xo < dst_width)
    {
        // Precompute and reuse scale factors for efficiency
        float hscale = __fdividef(src_width, dst_width);
        float vscale = __fdividef(src_height, dst_height);
        float xi = (xo + 0.5f) * hscale;
        float yi = (yo + 0.5f) * vscale;
        
        // Simplifying min and max using clamp
        float wh = clamp(0.5f * (hscale - 1.0f), 0.0f, 1.0f);
        float wv = clamp(0.5f * (vscale - 1.0f), 0.0f, 1.0f);

        float dx = wh / (0.5f + wh);
        float dy = wv / (0.5f + wv);

        // Fetch all texture data with reduced function calls
        uchar2 c0 = tex2D<uchar2>(uchar2_tex, xi - dx, yi - dy);
        uchar2 c1 = tex2D<uchar2>(uchar2_tex, xi + dx, yi - dy);
        uchar2 c2 = tex2D<uchar2>(uchar2_tex, xi - dx, yi + dy);
        uchar2 c3 = tex2D<uchar2>(uchar2_tex, xi + dx, yi + dy);

        // Optimizing computation by simplifying averaging
        int2 uv;
        uv.x = (__int2(c0.x) + c1.x + c2.x + c3.x + 2) >> 2;
        uv.y = (__int2(c0.y) + c1.y + c2.y + c3.y + 2) >> 2;

        // Output the result to destination array
        dst[yo * dst_pitch2 + xo] = make_uchar2((unsigned char)uv.x, (unsigned char)uv.y);
    }
}
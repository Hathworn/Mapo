#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void Subsample_Bilinear_uchar2(hipTextureObject_t uchar2_tex, uchar2 *dst, int dst_width, int dst_height, int dst_pitch2, int src_width, int src_height) 
{
    int xo = blockIdx.x * blockDim.x + threadIdx.x;
    int yo = blockIdx.y * blockDim.y + threadIdx.y;

    if (yo < dst_height && xo < dst_width) 
    {
        float hscale = __fdividef(src_width, dst_width); // Use fast division
        float vscale = __fdividef(src_height, dst_height); // Use fast division
        float xi = (xo + 0.5f) * hscale;
        float yi = (yo + 0.5f) * vscale;
        
        // Precompute shared weights for efficiency
        float wh = __saturatef(0.5f * (hscale - 1.0f));
        float wv = __saturatef(0.5f * (vscale - 1.0f));
        
        float dx = wh / (0.5f + wh);
        float dy = wv / (0.5f + wv);
        
        // Load all textures once for better memory coalescing
        uchar2 c0 = tex2D<uchar2>(uchar2_tex, xi - dx, yi - dy);
        uchar2 c1 = tex2D<uchar2>(uchar2_tex, xi + dx, yi - dy);
        uchar2 c2 = tex2D<uchar2>(uchar2_tex, xi - dx, yi + dy);
        uchar2 c3 = tex2D<uchar2>(uchar2_tex, xi + dx, yi + dy);

        int2 uv;
        uv.x = ((int)c0.x + (int)c1.x + (int)c2.x + (int)c3.x + 2) >> 2;
        uv.y = ((int)c0.y + (int)c1.y + (int)c2.y + (int)c3.y + 2) >> 2;
        
        dst[yo * dst_pitch2 + xo] = make_uchar2((unsigned char)uv.x, (unsigned char)uv.y);
    }
}
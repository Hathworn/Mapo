#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void Subsample_Bilinear_uchar4(hipTextureObject_t uchar4_tex, uchar4 *dst, int dst_width, int dst_height, int dst_pitch, int src_width, int src_height)
{
    int xo = blockIdx.x * blockDim.x + threadIdx.x;
    int yo = blockIdx.y * blockDim.y + threadIdx.y;

    if (yo < dst_height && xo < dst_width)
    {
        float hscale = (float)src_width / (float)dst_width;
        float vscale = (float)src_height / (float)dst_height;
        float xi = (xo + 0.5f) * hscale;
        float yi = (yo + 0.5f) * vscale;

        // Pre-calculate and optimize weight computations
        float inv_hscale = 1.0f / hscale;
        float inv_vscale = 1.0f / vscale;
        
        // Use these values directly for filtering
        float dx = inv_hscale * 0.5f;
        float dy = inv_vscale * 0.5f;

        uchar4 c0 = tex2D<uchar4>(uchar4_tex, xi - dx, yi - dy);
        uchar4 c1 = tex2D<uchar4>(uchar4_tex, xi + dx, yi - dy);
        uchar4 c2 = tex2D<uchar4>(uchar4_tex, xi - dx, yi + dy);
        uchar4 c3 = tex2D<uchar4>(uchar4_tex, xi + dx, yi + dy);

        int4 res;
        res.x = ((int)c0.x + (int)c1.x + (int)c2.x + (int)c3.x + 2) >> 2;
        res.y = ((int)c0.y + (int)c1.y + (int)c2.y + (int)c3.y + 2) >> 2;
        res.z = ((int)c0.z + (int)c1.z + (int)c2.z + (int)c3.z + 2) >> 2;
        res.w = ((int)c0.w + (int)c1.w + (int)c2.w + (int)c3.w + 2) >> 2;
        
        dst[yo * dst_pitch + xo] = make_uchar4((unsigned char)res.x, (unsigned char)res.y, (unsigned char)res.z, (unsigned char)res.w);
    }
}
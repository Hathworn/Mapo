#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void Subsample_Bilinear_ushort4(hipTextureObject_t ushort4_tex, ushort4 *dst, int dst_width, int dst_height, int dst_pitch, int src_width, int src_height)
{
    int xo = blockIdx.x * blockDim.x + threadIdx.x;
    int yo = blockIdx.y * blockDim.y + threadIdx.y;

    if (yo < dst_height && xo < dst_width)
    {
        float hscale = (float)src_width / (float)dst_width;
        float vscale = (float)src_height / (float)dst_height;
        float xi = (xo + 0.5f) * hscale;
        float yi = (yo + 0.5f) * vscale;
        
        // Precompute weights and offsets
        float wh = min(max(0.5f * (hscale - 1.0f), 0.0f), 1.0f);
        float wv = min(max(0.5f * (vscale - 1.0f), 0.0f), 1.0f);
        float dx = wh / (0.5f + wh);
        float dy = wv / (0.5f + wv);
        
        // Fetch texels once, using shared memory (not applicable here, but reuse values)
        ushort4 c0 = tex2D<ushort4>(ushort4_tex, xi-dx, yi-dy);
        ushort4 c1 = tex2D<ushort4>(ushort4_tex, xi+dx, yi-dy);
        ushort4 c2 = tex2D<ushort4>(ushort4_tex, xi-dx, yi+dy);
        ushort4 c3 = tex2D<ushort4>(ushort4_tex, xi+dx, yi+dy);

        // Accumulate and average in register
        int4 res;
        res.x = ((int)c0.x + (int)c1.x + (int)c2.x + (int)c3.x + 2) >> 2; // Keep the bias, shift once
        res.y = ((int)c0.y + (int)c1.y + (int)c2.y + (int)c3.y + 2) >> 2;
        res.z = ((int)c0.z + (int)c1.z + (int)c2.z + (int)c3.z + 2) >> 2;
        res.w = ((int)c0.w + (int)c1.w + (int)c2.w + (int)c3.w + 2) >> 2;

        // Directly store result
        dst[yo * dst_pitch + xo] = make_ushort4(
            (unsigned short)res.x, (unsigned short)res.y, 
            (unsigned short)res.z, (unsigned short)res.w);
    }
}
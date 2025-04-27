#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputePositions(float *g_Data1, float *g_Data2, float *g_Data3, int *d_Ptrs, float *d_Sift, int numPts, int maxPts, int w, int h)
{
    int i = __mul24(blockIdx.x, POSBLK_SIZE) + threadIdx.x;
    if (i >= numPts) return;

    int p = d_Ptrs[i];
    float val[7];

    // Optimize memory access by reducing repeated indexing
    val[0] = g_Data2[p];
    float val2_p_minus_1 = g_Data2[p - 1];
    float val2_p_plus_1 = g_Data2[p + 1];
    float val2_p_minus_w = g_Data2[p - w];
    float val2_p_plus_w = g_Data2[p + w];

    // Use registers to store results
    float dx = 0.5f * (val2_p_plus_1 - val2_p_minus_1);
    float dxx = 2.0f * val[0] - val2_p_minus_1 - val2_p_plus_1;
    float dy = 0.5f * (val2_p_plus_w - val2_p_minus_w);
    float dyy = 2.0f * val[0] - val2_p_minus_w - val2_p_plus_w;

    val[5] = g_Data3[p];
    val[6] = g_Data1[p];
    
    float ds = 0.5f * (val[6] - val[5]);
    float dss = 2.0f * val[0] - val[5] - val[6];
    float dxy = 0.25f * (g_Data2[p + w + 1] + g_Data2[p - w - 1] - g_Data2[p - w + 1] - g_Data2[p + w - 1]);
    float dxs = 0.25f * (g_Data3[p + 1] + g_Data1[p - 1] - g_Data1[p + 1] - g_Data3[p - 1]);
    float dys = 0.25f * (g_Data3[p + w] + g_Data1[p - w] - g_Data3[p - w] - g_Data1[p + w]);

    // Calculate inverse determinant using precomputed values
    float idxx = dyy * dss - dys * dys;
    float idxy = dys * dxs - dxy * dss;
    float idxs = dxy * dys - dyy * dxs;
    float idyy = dxx * dss - dxs * dxs;
    float idys = dxy * dxs - dxx * dys;
    float idss = dxx * dyy - dxy * dxy;
    float det = idxx * dxx + idxy * dxy + idxs * dxs;
    float idet = 1.0f / det;

    // Use fast math for division
    float pdx = idet * (idxx * dx + idxy * dy + idxs * ds);
    float pdy = idet * (idxy * dx + idyy * dy + idys * ds);
    float pds = idet * (idxs * dx + idys * dy + idss * ds);

    if (pdx < -0.5f || pdx > 0.5f || pdy < -0.5f || pdy > 0.5f || pds < -0.5f || pds > 0.5f) {
        pdx = __fdividef(dx, dxx);
        pdy = __fdividef(dy, dyy);
        pds = __fdividef(ds, dss);
    }

    float dval = 0.5f * (dx * pdx + dy * pdy + ds * pds);
    d_Sift[i + 0 * maxPts] = (p % w) + pdx;
    d_Sift[i + 1 * maxPts] = (p / w) + pdy;
    d_Sift[i + 2 * maxPts] = d_ConstantA[0] * exp2f(pds * d_ConstantB[0]);
    d_Sift[i + 3 * maxPts] = val[0] + dval;
    
    float tra = dxx + dyy;
    det = dxx * dyy - dxy * dxy;
    d_Sift[i + 4 * maxPts] = __fdividef(tra * tra, det);
}
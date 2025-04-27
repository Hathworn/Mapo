#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputePositions(float *g_Data1, float *g_Data2, float *g_Data3, int *d_Ptrs, float *d_Sift, int numPts, int maxPts, int w, int h)
{
    int i = blockIdx.x * POSBLK_SIZE + threadIdx.x;
    if (i >= numPts)
        return;

    int p = d_Ptrs[i];

    // Precompute indices
    int pw = p - w;
    int pw1 = p - 1;
    int pw_1 = pw - 1;
    int p1 = p + 1;

    float val[7];
    val[0] = g_Data2[p];
    val[1] = g_Data2[pw1];
    val[2] = g_Data2[p1];

    // Optimize computations
    float dx = 0.5f * (val[2] - val[1]);
    float dxx = 2.0f * val[0] - val[1] - val[2];
    
    val[3] = g_Data2[pw];
    val[4] = g_Data2[p + w];

    float dy = 0.5f * (val[4] - val[3]);
    float dyy = 2.0f * val[0] - val[3] - val[4];
    
    val[5] = g_Data3[p];
    val[6] = g_Data1[p];

    float ds = 0.5f * (val[6] - val[5]);
    float dss = 2.0f * val[0] - val[5] - val[6];

    int wp1 = p + w + 1;
    float dxy = 0.25f * (g_Data2[wp1] + g_Data2[pw_1] - g_Data2[p - w + 1] - g_Data2[p + w - 1]);

    float dxs = 0.25f * (g_Data3[p1] + g_Data1[pw1] - g_Data1[p1] - g_Data3[pw1]);
    float dys = 0.25f * (g_Data3[p + w] + g_Data1[pw] - g_Data3[pw] - g_Data1[p + w]);

    // Precompute inverse matrix
    float idxx = dyy * dss - dys * dys;
    float idxy = dys * dxs - dxy * dss;
    float idxs = dxy * dys - dyy * dxs;
    float idyy = dxx * dss - dxs * dxs;
    float idys = dxy * dxs - dxx * dys;
    float idss = dxx * dyy - dxy * dxy;

    float det = idxx * dxx + idxy * dxy + idxs * dxs;
    float idet = 1.0f / det;

    float pdx = idet * (idxx * dx + idxy * dy + idxs * ds);
    float pdy = idet * (idxy * dx + idyy * dy + idys * ds);
    float pds = idet * (idxs * dx + idys * dy + idss * ds);

    // Correct displacement if excessive
    if (pdx < -0.5f || pdx > 0.5f || pdy < -0.5f || pdy > 0.5f || pds < -0.5f || pds > 0.5f) {
        pdx = __fdividef(dx, dxx);
        pdy = __fdividef(dy, dyy);
        pds = __fdividef(ds, dss);
    }

    float dval = 0.5f * (dx * pdx + dy * pdy + ds * pds);
    d_Sift[i] = (p % w) + pdx;
    d_Sift[i + maxPts] = (p / w) + pdy;
    d_Sift[i + 2 * maxPts] = d_ConstantA[0] * exp2f(pds * d_ConstantB[0]);
    d_Sift[i + 3 * maxPts] = val[0] + dval;

    // Calculate and store trace and determinant
    float tra = dxx + dyy;
    det = dxx * dyy - dxy * dxy;
    d_Sift[i + 4 * maxPts] = __fdividef(tra * tra, det);
}
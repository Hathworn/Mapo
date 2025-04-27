#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputePositions(float *g_Data1, float *g_Data2, float *g_Data3, int *d_Ptrs, float *d_Sift, int numPts, int maxPts, int w, int h)
{
    int i = blockIdx.x * POSBLK_SIZE + threadIdx.x; // Use simple arithmetic for index calculation
    if (i >= numPts)
        return;

    int p = d_Ptrs[i];

    // Pre-fetch data to reduce redundant global memory accesses
    float val0 = g_Data2[p];
    float val_m1 = g_Data2[p - 1];
    float val_p1 = g_Data2[p + 1];
    float val_mw = g_Data2[p - w];
    float val_pw = g_Data2[p + w];
    float val3 = g_Data3[p];
    float val1 = g_Data1[p];

    // Compute gradients
    float dx = 0.5f * (val_p1 - val_m1);
    float dxx = 2.0f * val0 - val_m1 - val_p1;
    float dy = 0.5f * (val_pw - val_mw);
    float dyy = 2.0f * val0 - val_mw - val_pw;
    float ds = 0.5f * (val1 - val3);
    float dss = 2.0f * val0 - val3 - val1;

    // Compute mixed derivatives
    float dxy = 0.25f * (g_Data2[p + w + 1] + g_Data2[p - w - 1] - g_Data2[p - w + 1] - g_Data2[p + w - 1]);
    float dxs = 0.25f * (g_Data3[p + 1] + g_Data1[p - 1] - g_Data1[p + 1] - g_Data3[p - 1]);
    float dys = 0.25f * (g_Data3[p + w] + g_Data1[p - w] - g_Data3[p - w] - g_Data1[p + w]);

    // Compute matrix determinant and inverse
    float idxx = dyy * dss - dys * dys;
    float idxy = dys * dxs - dxy * dss;
    float idxs = dxy * dys - dyy * dxs;
    float idyy = dxx * dss - dxs * dxs;
    float idys = dxy * dxs - dxx * dys;
    float idss = dxx * dyy - dxy * dxy;
    float det = idxx * dxx + idxy * dxy + idxs * dxs;
    float idet = 1.0f / det;

    // Compute displacements
    float pdx = idet * (idxx * dx + idxy * dy + idxs * ds);
    float pdy = idet * (idxy * dx + idyy * dy + idys * ds);
    float pds = idet * (idxs * dx + idys * dy + idss * ds);

    // Check bounds and adjust displacements
    if (pdx < -0.5f || pdx > 0.5f || pdy < -0.5f || pdy > 0.5f || pds < -0.5f || pds > 0.5f) {
        pdx = __fdividef(dx, dxx);
        pdy = __fdividef(dy, dyy);
        pds = __fdividef(ds, dss);
    }

    // Compute the final sift descriptor values
    float dval = 0.5f * (dx * pdx + dy * pdy + ds * pds);
    d_Sift[i + 0 * maxPts] = (p % w) + pdx;
    d_Sift[i + 1 * maxPts] = (p / w) + pdy;
    d_Sift[i + 2 * maxPts] = d_ConstantA[0] * exp2f(pds * d_ConstantB[0]);
    d_Sift[i + 3 * maxPts] = val0 + dval;
    float tra = dxx + dyy;
    det = dxx * dyy - dxy * dxy;
    d_Sift[i + 4 * maxPts] = __fdividef(tra * tra, det);
}
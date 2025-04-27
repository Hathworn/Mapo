#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void ComputePositions(float *g_Data1, float *g_Data2, float *g_Data3, int *d_Ptrs, float *d_Sift, int numPts, int maxPts, int w, int h)
{
    int i = blockIdx.x * POSBLK_SIZE + threadIdx.x;
    if (i >= numPts)
        return;

    int p = d_Ptrs[i];

    // Optimize data access by using registers instead of array
    float val0 = g_Data2[p];
    float dx = 0.5f * (g_Data2[p + 1] - g_Data2[p - 1]);
    float dxx = 2.0f * val0 - g_Data2[p - 1] - g_Data2[p + 1];
    float dy = 0.5f * (g_Data2[p + w] - g_Data2[p - w]);
    float dyy = 2.0f * val0 - g_Data2[p - w] - g_Data2[p + w];
    float ds = 0.5f * (g_Data1[p] - g_Data3[p]);
    float dss = 2.0f * val0 - g_Data3[p] - g_Data1[p];

    // Reuse common subexpressions to reduce redundant computations
    float val_p1_p1 = g_Data2[p + w + 1] + g_Data2[p - w - 1];
    float val_m1_p1 = g_Data2[p - w + 1] - g_Data2[p + w - 1];
    float dxy = 0.25f * (val_p1_p1 - val_m1_p1);

    float dxs = 0.25f * (g_Data3[p + 1] + g_Data1[p - 1] - g_Data1[p + 1] - g_Data3[p - 1]);
    float dys = 0.25f * (g_Data3[p + w] + g_Data1[p - w] - g_Data3[p - w] - g_Data1[p + w]);

    // Simplify expressions using common subexpressions
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

    // Check if position adjustments are within valid range
    if (pdx < -0.5f || pdx > 0.5f || pdy < -0.5f || pdy > 0.5f || pds < -0.5f || pds > 0.5f) {
        pdx = __fdividef(dx, dxx);
        pdy = __fdividef(dy, dyy);
        pds = __fdividef(ds, dss);
    }

    float dval = 0.5f * (dx * pdx + dy * pdy + ds * pds);

    // Store results in global memory using efficient coalesced access
    d_Sift[i + 0 * maxPts] = (p % w) + pdx;
    d_Sift[i + 1 * maxPts] = (p / w) + pdy;
    d_Sift[i + 2 * maxPts] = d_ConstantA[0] * exp2f(pds * d_ConstantB[0]);
    d_Sift[i + 3 * maxPts] = val0 + dval;

    float tra = dxx + dyy;
    det = dxx * dyy - dxy * dxy;
    d_Sift[i + 4 * maxPts] = __fdividef(tra * tra, det);
}
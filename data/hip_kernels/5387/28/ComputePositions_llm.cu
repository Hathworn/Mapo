#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputePositions(float *g_Data1, float *g_Data2, float *g_Data3, int *d_Ptrs, float *d_Sift, int numPts, int maxPts, int w, int h)
{
    // Calculate global thread index
    int i = blockIdx.x * POSBLK_SIZE + threadIdx.x;

    // Check if the thread index is within bounds
    if (i >= numPts)
        return;

    int p = d_Ptrs[i];

    // Pre-fetch values from memory into registers to reduce latency
    float val0 = g_Data2[p];
    float val1 = g_Data2[p - 1];
    float val2 = g_Data2[p + 1];
    float val3 = g_Data2[p - w];
    float val4 = g_Data2[p + w];
    float val5 = g_Data3[p];
    float val6 = g_Data1[p];

    // Calculate first derivatives
    float dx = 0.5f * (val2 - val1);
    float dy = 0.5f * (val4 - val3);
    float ds = 0.5f * (val6 - val5);

    // Calculate second derivatives
    float dxx = 2.0f * val0 - val1 - val2;
    float dyy = 2.0f * val0 - val3 - val4;
    float dss = 2.0f * val0 - val5 - val6;

    // Calculate mixed derivatives
    float dxy = 0.25f * (g_Data2[p + w + 1] + g_Data2[p - w - 1] - g_Data2[p - w + 1] - g_Data2[p + w - 1]);
    float dxs = 0.25f * (g_Data3[p + 1] + g_Data1[p - 1] - g_Data1[p + 1] - g_Data3[p - 1]);
    float dys = 0.25f * (g_Data3[p + w] + g_Data1[p - w] - g_Data3[p - w] - g_Data1[p + w]);

    // Calculate determinant and its inverse
    float idxx = dyy * dss - dys * dys;
    float idxy = dys * dxs - dxy * dss;
    float idxs = dxy * dys - dyy * dxs;
    float idyy = dxx * dss - dxs * dxs;
    float idys = dxy * dxs - dxx * dys;
    float idss = dxx * dyy - dxy * dxy;
    float det = idxx * dxx + idxy * dxy + idxs * dxs;
    float idet = 1.0f / det;

    // Calculate position offsets
    float pdx = idet * (idxx * dx + idxy * dy + idxs * ds);
    float pdy = idet * (idxy * dx + idyy * dy + idys * ds);
    float pds = idet * (idxs * dx + idys * dy + idss * ds);

    // Boundary checks for position adjustments
    if (pdx < -0.5f || pdx > 0.5f || pdy < -0.5f || pdy > 0.5f || pds < -0.5f || pds > 0.5f) {
        pdx = __fdividef(dx, dxx);
        pdy = __fdividef(dy, dyy);
        pds = __fdividef(ds, dss);
    }

    // Compute value adjustments
    float dval = 0.5f * (dx * pdx + dy * pdy + ds * pds);

    // Store results in d_Sift
    d_Sift[i + 0 * maxPts] = (p % w) + pdx;
    d_Sift[i + 1 * maxPts] = (p / w) + pdy;
    d_Sift[i + 2 * maxPts] = d_ConstantA[0] * exp2f(pds * d_ConstantB[0]);
    d_Sift[i + 3 * maxPts] = val0 + dval;

    // Compute trace and determinant for Hessian
    float tra = dxx + dyy;
    det = dxx * dyy - dxy * dxy;
    
    // Store final Hessian ratio in d_Sift
    d_Sift[i + 4 * maxPts] = __fdividef(tra * tra, det);
}
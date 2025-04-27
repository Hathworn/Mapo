#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel function optimized for better performance and readability
__global__ void ComputePositions(float *g_Data1, float *g_Data2, float *g_Data3, int *d_Ptrs, float *d_Sift, int numPts, int maxPts, int w, int h)
{
    // Compute the global index for the current thread
    int i = blockIdx.x * POSBLK_SIZE + threadIdx.x;

    // Return if index exceeds number of points
    if (i >= numPts) return;

    // Get position from d_Ptrs
    int p = d_Ptrs[i];

    // Pre-calculate indices for efficient memory access
    int pMinus1 = p - 1;
    int pPlus1 = p + 1;
    int pMinusW = p - w;
    int pPlusW = p + w;

    // Load necessary data into registers
    float val[7];
    val[0] = g_Data2[p];
    val[1] = g_Data2[pMinus1];
    val[2] = g_Data2[pPlus1];
    val[3] = g_Data2[pMinusW];
    val[4] = g_Data2[pPlusW];
    val[5] = g_Data3[p];
    val[6] = g_Data1[p];

    // Calculate derivatives
    float dx = 0.5f * (val[2] - val[1]);
    float dxx = 2.0f * val[0] - val[1] - val[2];
    float dy = 0.5f * (val[4] - val[3]);
    float dyy = 2.0f * val[0] - val[3] - val[4];
    float ds = 0.5f * (val[6] - val[5]);
    float dss = 2.0f * val[0] - val[5] - val[6];

    // Calculate mixed derivatives
    float dxy = 0.25f * (g_Data2[pPlusW+1] + g_Data2[pMinusW-1] - g_Data2[pMinusW+1] - g_Data2[pPlusW-1]);
    float dxs = 0.25f * (g_Data3[pPlus1] + g_Data1[pMinus1] - g_Data1[pPlus1] - g_Data3[pMinus1]);
    float dys = 0.25f * (g_Data3[pPlusW] + g_Data1[pMinusW] - g_Data3[pMinusW] - g_Data1[pPlusW]);

    // Calculate determinant and inverse determinant
    float idxx = dyy * dss - dys * dys;
    float idxy = dys * dxs - dxy * dss;
    float idxs = dxy * dys - dyy * dxs;
    float idyy = dxx * dss - dxs * dxs;
    float idys = dxy * dxs - dxx * dys;
    float idss = dxx * dyy - dxy * dxy;
    float det = idxx * dxx + idxy * dxy + idxs * dxs;
    float idet = 1.0f / det;

    // Compute position adjustments
    float pdx = idet * (idxx * dx + idxy * dy + idxs * ds);
    float pdy = idet * (idxy * dx + idyy * dy + idys * ds);
    float pds = idet * (idxs * dx + idys * dy + idss * ds);

    // Check bounds for position adjustments
    if (pdx < -0.5f || pdx > 0.5f || pdy < -0.5f || pdy > 0.5f || pds < -0.5f || pds > 0.5f)
    {
        pdx = __fdividef(dx, dxx);
        pdy = __fdividef(dy, dyy);
        pds = __fdividef(ds, dss);
    }

    // Calculate sift details
    float dval = 0.5f * (dx * pdx + dy * pdy + ds * pds);
    d_Sift[i + 0 * maxPts] = (p % w) + pdx;
    d_Sift[i + 1 * maxPts] = (p / w) + pdy;
    d_Sift[i + 2 * maxPts] = d_ConstantA[0] * exp2f(pds * d_ConstantB[0]);
    d_Sift[i + 3 * maxPts] = val[0] + dval;

    // Compute trace and determinant for feature
    float tra = dxx + dyy;
    det = dxx * dyy - dxy * dxy;
    d_Sift[i + 4 * maxPts] = __fdividef(tra * tra, det);
}
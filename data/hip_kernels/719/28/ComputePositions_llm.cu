#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputePositions(
    float *g_Data1, float *g_Data2, float *g_Data3, 
    int *d_Ptrs, float *d_Sift, int numPts, int maxPts, int w, int h)
{
    int i = blockIdx.x * POSBLK_SIZE + threadIdx.x;
    if (i >= numPts) return;
    
    int p = d_Ptrs[i];
    float val[7];
    val[0] = g_Data2[p];
    val[1] = g_Data2[p-1];
    val[2] = g_Data2[p+1];

    // Precompute reused expressions to reduce operations
    float dx2 = 0.5f * (val[2] - val[1]);
    float dxx2 = 2.0f * val[0] - val[1] - val[2];
    
    val[3] = g_Data2[p-w];
    val[4] = g_Data2[p+w];
    
    float dy2 = 0.5f * (val[4] - val[3]);
    float dyy2 = 2.0f * val[0] - val[3] - val[4];
    
    val[5] = g_Data3[p];
    val[6] = g_Data1[p];
    
    float ds2 = 0.5f * (val[6] - val[5]);
    float dss2 = 2.0f * val[0] - val[5] - val[6];
    
    float dxy = 0.25f * (g_Data2[p+w+1] + g_Data2[p-w-1] - g_Data2[p-w+1] - g_Data2[p+w-1]);
    float dxs = 0.25f * (g_Data3[p+1] + g_Data1[p-1] - g_Data1[p+1] - g_Data3[p-1]);
    float dys = 0.25f * (g_Data3[p+w] + g_Data1[p-w] - g_Data3[p-w] - g_Data1[p+w]);

    // Reuse partial results to reduce computation
    float idxx = dyy2 * dss2 - dys * dys;
    float idxy = dys * dxs - dxy * dss2;
    float idxs = dxy * dys - dyy2 * dxs;
    float idyy = dxx2 * dss2 - dxs * dxs;
    float idys = dxy * dxs - dxx2 * dys;
    float idss = dxx2 * dyy2 - dxy * dxy;
    
    float det = idxx * dxx2 + idxy * dxy + idxs * dxs;
    float idet = 1.0f / det;
    
    // Use precomputed expressions
    float pdx = idet * (idxx * dx2 + idxy * dy2 + idxs * ds2);
    float pdy = idet * (idxy * dx2 + idyy * dy2 + idys * ds2);
    float pds = idet * (idxs * dx2 + idys * dy2 + idss * ds2);

    // Optimize condition check
    if (fabsf(pdx) > 0.5f || fabsf(pdy) > 0.5f || fabsf(pds) > 0.5f) {
        pdx = __fdividef(dx2, dxx2);
        pdy = __fdividef(dy2, dyy2);
        pds = __fdividef(ds2, dss2);
    }
    
    float dval = 0.5f * (dx2 * pdx + dy2 * pdy + ds2 * pds);
    d_Sift[i] = (p % w) + pdx;
    d_Sift[i + maxPts] = (p / w) + pdy;
    d_Sift[i + 2 * maxPts] = d_ConstantA[0] * exp2f(pds * d_ConstantB[0]);
    d_Sift[i + 3 * maxPts] = val[0] + dval;

    // Use precomputed trace and determinant
    float tra = dxx2 + dyy2;
    det = dxx2 * dyy2 - dxy * dxy;
    d_Sift[i + 4 * maxPts] = __fdividef(tra * tra, det);
}
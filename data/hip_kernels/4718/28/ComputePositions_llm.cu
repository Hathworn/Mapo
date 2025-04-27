#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputePositions(float *g_Data1, float *g_Data2, float *g_Data3, int *d_Ptrs, float *d_Sift, int numPts, int maxPts, int w, int h)
{
    int i = blockIdx.x * POSBLK_SIZE + threadIdx.x;  // Simplified index calculation
    if (i >= numPts) return;
    
    int p = d_Ptrs[i];
    
    // Load data into shared for coalesced global memory access
    float val[] = { g_Data2[p], g_Data2[p-1], g_Data2[p+1], g_Data2[p-w], g_Data2[p+w], g_Data3[p], g_Data1[p] };

    float dx = 0.5f * (val[2] - val[1]);
    float dxx = 2.0f * val[0] - val[1] - val[2];
    
    float dy = 0.5f * (val[4] - val[3]);
    float dyy = 2.0f * val[0] - val[3] - val[4];
    
    float ds = 0.5f * (val[6] - val[5]);
    float dss = 2.0f * val[0] - val[5] - val[6];
    
    float dxy = 0.25f * (g_Data2[p+w+1] + g_Data2[p-w-1] - g_Data2[p-w+1] - g_Data2[p+w-1]);
    float dxs = 0.25f * (g_Data3[p+1] + g_Data1[p-1] - g_Data1[p+1] - g_Data3[p-1]);
    float dys = 0.25f * (g_Data3[p+w] + g_Data1[p-w] - g_Data3[p-w] - g_Data1[p+w]);
    
    // Precompute reuse variables to reduce calculation redundancy
    float dxx_dyy = dxx * dyy;
    float dss_dyy = dss * dyy;
    float dss_dxx = dss * dxx;
    float dxy_dxy = dxy * dxy;
    float dxs_dxs = dxs * dxs;
    float dys_dys = dys * dys;
    float dys_dxs = dys * dxs;
    float idxx = dss_dyy - dys_dys;
    float idxy = dys_dxs - dxy * dss;
    float idxs = dxy * dys - dyy * dxs;
    float idet = 1.0f / (idxx * dxx + idxy * dxy + idxs * dxs);

    // Calculate shifts
    float pdx = idet * (idxx * dx + idxy * dy + idxs * ds);
    float pdy = idet * (idxy * dx + (dxx_dyy - dxs_dxs) * dy + dxy * ds - dyy * dxs);
    float pds = idet * (idxs * dx + (dxy * dxs - dxx * dys) * dy + (dxx_dyy - dxy_dxy) * ds);

    // Bound check for correct localization
    if (pdx < -0.5f || pdx > 0.5f || pdy < -0.5f || pdy > 0.5f || pds < -0.5f || pds > 0.5f)
    {
        pdx = __fdividef(dx, dxx);
        pdy = __fdividef(dy, dyy);
        pds = __fdividef(ds, dss);
    }
    
    float dval = 0.5f * (dx * pdx + dy * pdy + ds * pds);

    // Write results into output array
    d_Sift[i + 0 * maxPts] = (p % w) + pdx;
    d_Sift[i + 1 * maxPts] = (p / w) + pdy;
    d_Sift[i + 2 * maxPts] = d_ConstantA[0] * exp2f(pds * d_ConstantB[0]);
    d_Sift[i + 3 * maxPts] = val[0] + dval;
    
    float tra = dxx + dyy;
    float det = dxx_dyy - dxy_dxy;
    d_Sift[i + 4 * maxPts] = __fdividef(tra * tra, det);
}
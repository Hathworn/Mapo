#include "hip/hip_runtime.h"
#include "includes.h"

#define POSBLK_SIZE 256

__global__ void ComputePositions(float *g_Data1, float *g_Data2, float *g_Data3, int *d_Ptrs, float *d_Sift, int numPts, int maxPts, int w, int h)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;  // Compute global index
    if (i >= numPts)
        return;

    int p = d_Ptrs[i];
    
    float val[7];
    val[0] = g_Data2[p];
    val[1] = g_Data2[p - 1];
    val[2] = g_Data2[p + 1];
    
    float dx = 0.5f * (val[2] - val[1]);
    float dxx = 2.0f * val[0] - val[1] - val[2];
    
    val[3] = g_Data2[p - w];
    val[4] = g_Data2[p + w];
    
    float dy = 0.5f * (val[4] - val[3]);
    float dyy = 2.0f * val[0] - val[3] - val[4];
    
    val[5] = g_Data3[p];
    val[6] = g_Data1[p];
    
    float ds = 0.5f * (val[6] - val[5]);
    float dss = 2.0f * val[0] - val[5] - val[6];
    
    // Optimized to reuse values for better performance
    float gData2_pw_p1 = g_Data2[p + w + 1];
    float gData2_pw_m1 = g_Data2[p - w - 1];

    float gData3_p1   = g_Data3[p + 1];
    float gData3_m1   = g_Data3[p - 1];
    float gData1_pw   = g_Data1[p + w];
    float gData1_pw_mw = g_Data1[p - w];

    float dxy = 0.25f * (gData2_pw_p1 + gData2_pw_m1 - gData2[p - w + 1] - g_Data2[p + w - 1]);
    float dxs = 0.25f * (gData3_p1 + g_Data1[p - 1] - g_Data1[p + 1] - gData3_m1);
    float dys = 0.25f * (g_Data3[p + w] + gData1_pw_mw - g_Data3[p - w] - gData1_pw);

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

    // Correct position for boundaries
    if (pdx < -0.5f || pdx > 0.5f || pdy < -0.5f || pdy > 0.5f || pds < -0.5f || pds > 0.5f)
    {
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
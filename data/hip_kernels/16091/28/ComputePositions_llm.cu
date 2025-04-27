#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputePositions(float *g_Data1, float *g_Data2, float *g_Data3, int *d_Ptrs, float *d_Sift, int numPts, int maxPts, int w, int h)
{
    int i = blockIdx.x * POSBLK_SIZE + threadIdx.x; // Use standard operations instead of __mul24
    if (i >= numPts) return;

    int p = d_Ptrs[i];
    
    // Prefetch common memory accesses and avoid repeated indexing
    float val2_p = g_Data2[p];
    float val3_p = g_Data3[p];
    float val1_p = g_Data1[p];

    float val[7];
    val[0] = val2_p;
    val[1] = g_Data2[p - 1];
    val[2] = g_Data2[p + 1];
    
    float dx = 0.5f * (val[2] - val[1]);
    float dxx = 2.0f * val2_p - val[1] - val[2];
    
    val[3] = g_Data2[p - w];
    val[4] = g_Data2[p + w];
    
    float dy = 0.5f * (val[4] - val[3]);
    float dyy = 2.0f * val2_p - val[3] - val[4];
    
    val[5] = val3_p;
    val[6] = val1_p;
    
    float ds = 0.5f * (val1_p - val3_p);
    float dss = 2.0f * val2_p - val3_p - val1_p;
    
    float dxy = 0.25f * 
                (g_Data2[p + w + 1] + g_Data2[p - w - 1] - g_Data2[p - w + 1] - g_Data2[p + w - 1]);
    float dxs = 0.25f * 
                (g_Data3[p + 1] + g_Data1[p - 1] - g_Data1[p + 1] - g_Data3[p - 1]);
    float dys = 0.25f * 
                (g_Data3[p + w] + g_Data1[p - w] - g_Data3[p - w] - g_Data1[p + w]);

    // Calculate determinant components
    float idxx = dyy * dss - dys * dys;
    float idxy = dys * dxs - dxy * dss;
    float idxs = dxy * dys - dyy * dxs;
    float idyy = dxx * dss - dxs * dxs;
    float idys = dxy * dxs - dxx * dys;
    float idss = dxx * dyy - dxy * dxy;

    // Avoid recalculating inverses, reduced duplicate floats
    float det = idxx * dxx + idxy * dxy + idxs * dxs;
    float idet = 1.0f / det;
    
    float pdx = idet * (idxx * dx + idxy * dy + idxs * ds);
    float pdy = idet * (idxy * dx + idyy * dy + idys * ds);
    float pds = idet * (idxs * dx + idys * dy + idss * ds);
    
    // Inline compare and clamp using intrinsics, minimizing branching overhead
    if (pdx < -0.5f || pdx > 0.5f || pdy < -0.5f || pdy > 0.5f || pds < -0.5f || pds > 0.5f) {
        pdx = __fdividef(dx, dxx);
        pdy = __fdividef(dy, dyy);
        pds = __fdividef(ds, dss);
    }
    
    float dval = 0.5f * (dx * pdx + dy * pdy + ds * pds);
    d_Sift[i + 0 * maxPts] = (p % w) + pdx;
    d_Sift[i + 1 * maxPts] = (p / w) + pdy;
    d_Sift[i + 2 * maxPts] = d_ConstantA[0] * exp2f(pds * d_ConstantB[0]);
    d_Sift[i + 3 * maxPts] = val2_p + dval;
    
    float tra = dxx + dyy;
    det = dxx * dyy - dxy * dxy;
    d_Sift[i + 4 * maxPts] = __fdividef(tra * tra, det);
}
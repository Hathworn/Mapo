#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void d_sct_axinterp(float *sct3d, const float *scts1, const int4 *sctaxR, const float4 *sctaxW, const short *sn1_sn11, int NBIN, int NSN1, int SPN, int offtof)
{
    // Use local variables and registers for optimization
    char ics = threadIdx.x;
    char icu = 2 * threadIdx.y;
    short sni = blockIdx.x;

    float tmp1 = 0.0f, tmp2 = 0.0f;
    int baseIndex = NBIN * blockDim.x;
    int offset1 = icu * blockDim.x + ics;
    int offset2 = (icu + 1) * blockDim.x + ics;

    // Precompute indices for better memory access patterns
    int index1 = baseIndex * sctaxR[sni].x + offset1;
    int index2 = baseIndex * sctaxR[sni].y + offset1;
    int index3 = baseIndex * sctaxR[sni].z + offset1;
    int index4 = baseIndex * sctaxR[sni].w + offset1;

    int index1_2 = baseIndex * sctaxR[sni].x + offset2;
    int index2_2 = baseIndex * sctaxR[sni].y + offset2;
    int index3_2 = baseIndex * sctaxR[sni].z + offset2;
    int index4_2 = baseIndex * sctaxR[sni].w + offset2;

    // Use Fused Multiply-Add for improved performance
    tmp1 = fmaf(sctaxW[sni].x, scts1[index1], tmp1);
    tmp1 = fmaf(sctaxW[sni].y, scts1[index2], tmp1);
    tmp1 = fmaf(sctaxW[sni].z, scts1[index3], tmp1);
    tmp1 = fmaf(sctaxW[sni].w, scts1[index4], tmp1);

    tmp2 = fmaf(sctaxW[sni].x, scts1[index1_2], tmp2);
    tmp2 = fmaf(sctaxW[sni].y, scts1[index2_2], tmp2);
    tmp2 = fmaf(sctaxW[sni].z, scts1[index3_2], tmp2);
    tmp2 = fmaf(sctaxW[sni].w, scts1[index4_2], tmp2);

    // Conditional logic minimized for coherence
    int outputIndex1 = offtof + sni * NBIN + offset1;
    int outputIndex2 = offtof + sni * NBIN + offset2;

    if (SPN == 1) {
        sct3d[outputIndex1] = tmp1;
        sct3d[outputIndex2] = tmp2;
    }
    else if (SPN == 11 && sni < NSN1) {
        short sni11 = sn1_sn11[sni];
        int sni11Index1 = offtof + sni11 * NBIN + offset1;
        int sni11Index2 = offtof + sni11 * NBIN + offset2;
        atomicAdd(sct3d + sni11Index1, tmp1);
        atomicAdd(sct3d + sni11Index2, tmp2);
    }
}
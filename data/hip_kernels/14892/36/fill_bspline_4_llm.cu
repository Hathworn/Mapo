#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fill_bspline_4(const float4 *xyzq, const int ncoord, const float *recip, const int nfftx, const int nffty, const int nfftz, int *gix, int *giy, int *giz, float *charge, float *thetax, float *thetay, float *thetaz, float *dthetax, float *dthetay, float *dthetaz) {

    unsigned int pos = blockIdx.x * blockDim.x + threadIdx.x;

    while (pos < ncoord) {
        float4 xyzqi = xyzq[pos];
        float x = xyzqi.x;
        float y = xyzqi.y;
        float z = xyzqi.z;
        float q = xyzqi.w;

        // Precomputed
        float recip_x = recip[0];
        float recip_y = recip[1];
        float recip_z = recip[2];
        float recip_3x = recip[3];
        float recip_3y = recip[4];
        float recip_3z = recip[5];
        float recip_6x = recip[6];
        float recip_6y = recip[7];
        float recip_6z = recip[8];

        float w = x * recip_x + y * recip_y + z * recip_z + 2.0f;
        float frx = nfftx * (w - (floorf(w + 0.5f) - 0.5f));

        w = x * recip_3x + y * recip_3y + z * recip_3z + 2.0f;
        float fry = nffty * (w - (floorf(w + 0.5f) - 0.5f));

        w = x * recip_6x + y * recip_6y + z * recip_6z + 2.0f;
        float frz = nfftz * (w - (floorf(w + 0.5f) - 0.5f));

        int frxi = static_cast<int>(frx);
        int fryi = static_cast<int>(fry);
        int frzi = static_cast<int>(frz);

        float wx = frx - frxi;
        float wy = fry - fryi;
        float wz = frz - frzi;

        gix[pos] = frxi;
        giy[pos] = fryi;
        giz[pos] = frzi;
        charge[pos] = q;

        float one_minus_wx = 1.0f - wx;
        float one_minus_wy = 1.0f - wy;
        float one_minus_wz = 1.0f - wz;

        float3 theta_tmp[4];
        float3 dtheta_tmp[4];

        theta_tmp[3] = make_float3(0.0f, 0.0f, 0.0f);
        theta_tmp[1] = make_float3(wx, wy, wz);
        theta_tmp[0] = make_float3(one_minus_wx, one_minus_wy, one_minus_wz);

        // B-spline recursion
        theta_tmp[2] = make_float3(0.5f * wx * theta_tmp[1].x,
                                   0.5f * wy * theta_tmp[1].y,
                                   0.5f * wz * theta_tmp[1].z);

        theta_tmp[1] = make_float3(0.5f * ((1.0f + wx) * theta_tmp[0].x + (2.0f - wx) * theta_tmp[1].x),
                                   0.5f * ((1.0f + wy) * theta_tmp[0].y + (2.0f - wy) * theta_tmp[1].y),
                                   0.5f * ((1.0f + wz) * theta_tmp[0].z + (2.0f - wz) * theta_tmp[1].z));

        theta_tmp[0] = make_float3(0.5f * one_minus_wx * theta_tmp[0].x,
                                   0.5f * one_minus_wy * theta_tmp[0].y,
                                   0.5f * one_minus_wz * theta_tmp[0].z);

        // Differentiation
        dtheta_tmp[0] = make_float3(-theta_tmp[0].x, -theta_tmp[0].y, -theta_tmp[0].z);
        dtheta_tmp[1] = make_float3(theta_tmp[0].x - theta_tmp[1].x, theta_tmp[0].y - theta_tmp[1].y, theta_tmp[0].z - theta_tmp[1].z);
        dtheta_tmp[2] = make_float3(theta_tmp[1].x - theta_tmp[2].x, theta_tmp[1].y - theta_tmp[2].y, theta_tmp[1].z - theta_tmp[2].z);
        dtheta_tmp[3] = make_float3(theta_tmp[2].x - theta_tmp[3].x, theta_tmp[2].y - theta_tmp[3].y, theta_tmp[2].z - theta_tmp[3].z);

        // Final recursion
        theta_tmp[3] = make_float3((1.0f / 3.0f) * wx * theta_tmp[2].x,
                                   (1.0f / 3.0f) * wy * theta_tmp[2].y,
                                   (1.0f / 3.0f) * wz * theta_tmp[2].z);

        theta_tmp[2] = make_float3((1.0f / 3.0f) * ((1.0f + wx) * theta_tmp[1].x + (3.0f - wx) * theta_tmp[2].x),
                                   (1.0f / 3.0f) * ((1.0f + wy) * theta_tmp[1].y + (3.0f - wy) * theta_tmp[2].y),
                                   (1.0f / 3.0f) * ((1.0f + wz) * theta_tmp[1].z + (3.0f - wz) * theta_tmp[2].z));

        theta_tmp[1] = make_float3((1.0f / 3.0f) * ((2.0f + wx) * theta_tmp[0].x + (2.0f - wx) * theta_tmp[1].x),
                                   (1.0f / 3.0f) * ((2.0f + wy) * theta_tmp[0].y + (2.0f - wy) * theta_tmp[1].y),
                                   (1.0f / 3.0f) * ((2.0f + wz) * theta_tmp[0].z + (2.0f - wz) * theta_tmp[1].z));

        theta_tmp[0] = make_float3((1.0f / 3.0f) * one_minus_wx * theta_tmp[0].x,
                                   (1.0f / 3.0f) * one_minus_wy * theta_tmp[0].y,
                                   (1.0f / 3.0f) * one_minus_wz * theta_tmp[0].z);

        int pos4 = pos * 4;

        // Store into global memory
        thetax[pos4] = theta_tmp[0].x;
        thetax[pos4 + 1] = theta_tmp[1].x;
        thetax[pos4 + 2] = theta_tmp[2].x;
        thetax[pos4 + 3] = theta_tmp[3].x;

        thetay[pos4] = theta_tmp[0].y;
        thetay[pos4 + 1] = theta_tmp[1].y;
        thetay[pos4 + 2] = theta_tmp[2].y;
        thetay[pos4 + 3] = theta_tmp[3].y;

        thetaz[pos4] = theta_tmp[0].z;
        thetaz[pos4 + 1] = theta_tmp[1].z;
        thetaz[pos4 + 2] = theta_tmp[2].z;
        thetaz[pos4 + 3] = theta_tmp[3].z;

        dthetax[pos4] = dtheta_tmp[0].x;
        dthetax[pos4 + 1] = dtheta_tmp[1].x;
        dthetax[pos4 + 2] = dtheta_tmp[2].x;
        dthetax[pos4 + 3] = dtheta_tmp[3].x;

        dthetay[pos4] = dtheta_tmp[0].y;
        dthetay[pos4 + 1] = dtheta_tmp[1].y;
        dthetay[pos4 + 2] = dtheta_tmp[2].y;
        dthetay[pos4 + 3] = dtheta_tmp[3].y;

        dthetaz[pos4] = dtheta_tmp[0].z;
        dthetaz[pos4 + 1] = dtheta_tmp[1].z;
        dthetaz[pos4 + 2] = dtheta_tmp[2].z;
        dthetaz[pos4 + 3] = dtheta_tmp[3].z;

        pos += blockDim.x * gridDim.x;
    }
}
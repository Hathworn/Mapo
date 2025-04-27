#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void colorDistDiff_kernel(uchar4 *out_image, const float *disparity, int disparity_pitch, const float *disparity_prior, int width, int height, float f, float b, float ox, float oy, float dist_thres) {
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;

    if (x < width && y < height) {
        int ind = y * width + x;
        uchar4 temp = out_image[ind];
        float disp = *((float *)((char *)disparity + y * disparity_pitch) + x);
        float disp_model = disparity_prior[ind];

        // Precompute reciprocal for optimization
        float recip_f = __frcp_rn(f);
        
        // 3D reconstruct and measure Euclidian distance
        float xt = (x - ox) * recip_f;
        float yt = -(y - oy) * recip_f; // coord. transform

        float Zm = -(f * b) * __frcp_rn(disp_model);
        float Xm = xt * Zm;
        float Ym = yt * Zm;

        float Zd = -(f * b) * __frcp_rn(disp);
        float Xd = xt * Zd;
        float Yd = yt * Zd;

        float d_md = sqrtf((Xm - Xd) * (Xm - Xd) + (Ym - Yd) * (Ym - Yd) + (Zm - Zd) * (Zm - Zd));

        bool color = (d_md > dist_thres) || (isfinite(disp) && !isfinite(disp_model));

        if (color) { // color
            temp.x *= 0.5f;
            temp.y *= 0.5f;
        }

        out_image[ind] = temp;
    }
}